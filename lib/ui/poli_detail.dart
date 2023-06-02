import 'package:aldi/ui/poli_page.dart';
import 'package:aldi/ui/poli_update_form.dart';
import 'package:flutter/material.dart';
import 'package:aldi/model/poli.dart';
import 'poli_update_form.dart';

class poliDetail extends StatefulWidget {
  final Poli poli;

  const poliDetail({super.key, required this.poli});

  @override
  State<poliDetail> createState() => _poliDetailState();
}

class _poliDetailState extends State<poliDetail> {
  final _formkey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(_namaPoliCtrl, context),
              _tombolHapus(_namaPoliCtrl, context),
            ],
          )
        ],
      ),
    );
  }
}

_tombolUbah(TextEditingController _namaPoliCtrl, context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PoliUpdateForm(
                      poli: Poli(namaPoli: _namaPoliCtrl.text),
                    )));
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: Text("Ubah"));
}

_tombolHapus(TextEditingController _namaPoliCtrl, context) {
  return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: Text("Anda Yakin ingin menghapus data ini?!!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => poliPage()));
              },
              child: Text("Ya"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: Text("Hapus"));
}
