import 'package:aldi/model/poli.dart';
import 'package:aldi/service/poli_service.dart';
import 'package:aldi/ui/poli_page.dart';
import 'package:flutter/material.dart';
import 'poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formkey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Poli"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _fileNamaPoli(_namaPoliCtrl),
              SizedBox(
                height: 20,
              ),
              _tombolSimpan(_namaPoliCtrl, context)
            ],
          ),
        ),
      ),
    );
  }
}

_fileNamaPoli(TextEditingController _namaPoliCtrl) {
  return TextField(
    decoration: const InputDecoration(labelText: "Nama Poli"),
    controller: _namaPoliCtrl,
  );
}

_tombolSimpan(TextEditingController _namaPoliCtrl, BuildContext context) {
  return ElevatedButton(
      onPressed: () async {
        Poli poli =  new  Poli(namaPoli: _namaPoliCtrl.text);
        await PoliService().simpan(poli).then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => poliDetail(poli: poli))));
        });
      },
      child: const Text("Simpan"));
}
