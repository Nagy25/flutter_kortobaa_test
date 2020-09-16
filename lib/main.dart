import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/themes/theme.dart';
import 'package:provider/provider.dart';

import 'blocs/providers/user_view_model.dart';
import 'blocs/repositories/user_repository.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final userViewModel = UserViewModel(
      userRepo: UserRepository(prefs: await SharedPreferences.getInstance()));

  await userViewModel.init();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>.value(value: userViewModel),
      ],
      child: MaterialApp(
        title: 'Test Kortobaa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      )));
}


