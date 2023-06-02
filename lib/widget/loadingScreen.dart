import 'dart:async';

import 'package:aldi/ui/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingSreen extends StatefulWidget {
  const loadingSreen({super.key});

  @override
  State<loadingSreen> createState() => _loadingSreenState();
}

class _loadingSreenState extends State<loadingSreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), toNext);
  }

  void toNext() async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Beranda()), (route) => false);
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
