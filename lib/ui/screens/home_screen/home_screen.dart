import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/blocs/providers/user_view_model.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userViewModel;

  @override
  Widget build(BuildContext context) {
     userViewModel = Provider.of<UserViewModel>(context);
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return Scaffold(
      body: Container(
        color: userViewModel.isLoggedIn ? Colors.greenAccent : Colors.yellow,
        child: Stack(children: [
          Center(
              child: Text(
                userViewModel.isLoggedIn
                    ? translate("welcome")+" ${userViewModel.name}"
                    : translate('not_logged'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(40),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  _langBtn() ,

                  Spacer(),

                  _loginBtn(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _langBtn(){
    return RaisedButton(
      color: !userViewModel.isLoggedIn
          ? Colors.greenAccent
          : Colors.yellow,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)),
      child: Text(
        translate("lang"),
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        changeLocale(context, translate('reverse'));
      },
    );
  }

  Widget _loginBtn(){
    return RaisedButton(
      color: !userViewModel.isLoggedIn
          ? Colors.greenAccent
          : Colors.yellow,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)),
      child: Text(
        userViewModel.isLoggedIn ? 'LOGOUT' : 'LOGIN',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        userViewModel.isLoggedIn
            ? await userViewModel.logout()
            : await userViewModel.login();
      },
    );
  }
}
