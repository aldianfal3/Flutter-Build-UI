import 'dart:async';

import 'package:aldi/ui/beranda.dart';
import 'package:aldi/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingSreen2 extends StatefulWidget {
  const loadingSreen2({super.key});

  @override
  State<loadingSreen2> createState() => _loadingSreen2State();
}

class _loadingSreen2State extends State<loadingSreen2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), toNext);
  }

  void toNext() async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SpinKitFadingCircle(
        color: Color.fromARGB(255, 251, 255, 1),
        size: 50.0,
      )),
    );
  }
}
