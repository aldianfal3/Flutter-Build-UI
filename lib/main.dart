import 'package:aldi/helloWorld.dart';
import 'package:aldi/widget/loadingScreen.dart';
import 'package:aldi/ui/beranda.dart';
import 'package:aldi/ui/login.dart';
import 'package:aldi/ui/poli_page.dart';
import 'package:aldi/widget/loadingScreen2.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ALDI());

class ALDI extends StatelessWidget {
  const ALDI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Application I-Chat",
      home: loadingSreen2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
