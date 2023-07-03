import 'package:aldi/helpers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:aldi/ui/login.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == "admin1" && password == "admin") {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin1");

      isLogin = true;
    } else {
      Text("Login Tidak Valid");
    }
    return isLogin;
  }
}
