

import 'package:shared_preferences/shared_preferences.dart';

 Future<String> userToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  return token;
}