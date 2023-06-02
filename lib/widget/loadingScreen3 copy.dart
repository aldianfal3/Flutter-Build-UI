import 'dart:async';

import 'package:aldi/ui/beranda.dart';
import 'package:aldi/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingSreen3 extends StatefulWidget {
  const loadingSreen3({super.key});

  @override
  State<loadingSreen3> createState() => _loadingSreen3State();
}

class _loadingSreen3State extends State<loadingSreen3> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), toNext);
  }

  void toNext() async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SpinKitCircle(
        color: Colors.lightBlueAccent,
        size: 50.0,
      )),
    );
  }
}
