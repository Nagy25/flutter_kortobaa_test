

import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/blocs/providers/todo_view_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'blocs/providers/user_view_model.dart';
import 'blocs/repositories/user_repository.dart';
import 'helpers/locale_preferences.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_translate/localization_delegate.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final userViewModel = UserViewModel(
      userRepo: UserRepository(prefs: await SharedPreferences.getInstance()));

  await userViewModel.init();

  final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ar',
      supportedLocales: ['ar', 'en'],
      preferences: LocalePreferences());

  runApp(LocalizedApp(delegate,MultiProvider(
    providers: [
      ChangeNotifierProvider<UserViewModel>.value(value: userViewModel),
      ChangeNotifierProvider<ToDoViewModel>.value(value: ToDoViewModel(

      )),
    ],
      child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate

        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        title: 'Test Kortobaa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}



