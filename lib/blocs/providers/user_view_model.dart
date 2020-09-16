import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_test/blocs/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepo;

  UserViewModel({@required this.userRepo});

  String name;
  bool isLoggedIn;

  init() async {
    await _refreshAllStates();
  }

  _refreshAllStates() async {
    isLoggedIn = await userRepo.isLoggedIn();
    name = await userRepo.getName();
    notifyListeners();
  }

  login() async {
    await userRepo.login("John doe");
    await _refreshAllStates();
  }

  logout() async {
    await userRepo.logout();
    await _refreshAllStates();
  }
}