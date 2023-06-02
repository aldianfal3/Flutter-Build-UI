import 'package:flutter/material.dart';
import 'package:aldi/model/poli.dart';
import 'poli_detail.dart';

class Poliitem extends StatelessWidget {
  final Poli poli;

  const Poliitem({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${poli.namaPoli}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)
             => poliDetail(poli: poli)));
      },
    );
  }
}
