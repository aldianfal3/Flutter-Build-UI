import 'package:aldi/helloWorld.dart';
import 'package:aldi/helpers/user_info.dart';
import 'package:aldi/widget/loadingScreen.dart';
import 'package:aldi/ui/beranda.dart';
import 'package:aldi/ui/login.dart';
import 'package:aldi/ui/poli_page.dart';
import 'package:aldi/widget/loadingScreen2.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik App",
    debugShowCheckedModeBanner: false,
    home: token == null ? loadingSreen2() : Login(),
  ));
}
