import 'package:aldi/model/poli.dart';
import 'package:aldi/ui/poli_detail.dart';
import 'package:aldi/ui/poli_form.dart';
import 'package:flutter/material.dart';
import 'poli_item.dart';
import 'package:aldi/widget/sidebar.dart';

class poliPage extends StatefulWidget {
  const poliPage({super.key});

  @override
  State<poliPage> createState() => _poliPageState();
}

class _poliPageState extends State<poliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli All"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context,
                   MaterialPageRoute(builder: 
                   (context) => PoliForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Poliitem(poli: Poli(namaPoli: "Poli Anak")),
          Poliitem(poli: Poli(namaPoli: "Poli Kandungan")),
          Poliitem(poli: Poli(namaPoli: "Poli Gigi")),
          Poliitem(poli: Poli(namaPoli: "Poli THT")),
        ],
      ),
    );
  }
}
