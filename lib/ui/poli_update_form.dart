
import 'package:flutter/material.dart';
import 'package:aldi/model/poli.dart';
import 'poli_detail.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);
  
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
  
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formkey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
       _namaPoliCtrl.text = widget.poli.namaPoli; 
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Poli")),
      body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  _fieldNamaPoli(_namaPoliCtrl),
                  SizedBox(height: 20),
                  _tombolSave(_namaPoliCtrl, context)
                ],
              ))),
    );
  }
}

_fieldNamaPoli(TextEditingController _namaPoliCtrl) {
  return TextField(
    decoration: InputDecoration(labelText: "Nama Poli"),
    controller: _namaPoliCtrl,
  );
}

_tombolSave(TextEditingController _namaPoliCtrl, context ) {
  return ElevatedButton(
    onPressed: () {
      Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => poliDetail(poli: poli)));
    },
    child: const Text("Simpan Perubahan")
  );
}
