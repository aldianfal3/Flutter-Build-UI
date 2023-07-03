import 'package:aldi/service/poli_service.dart';
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

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    setState(() {
      _namaPoliCtrl.text = data.namaPoli;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
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
                  _tombolSave( _namaPoliCtrl, context, getData, MaterialPageRoute)
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

_tombolSave(TextEditingController _namaPoliCtrl, context, getData(), MaterialPageRoute) {
  return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
        String id = getData();
        await PoliService().ubah(poli, id).then((value) {
          Navigator.pop(context);
          Navigator.popAndPushNamed(context,
              MaterialPageRoute(builder: (context) => poliDetail(poli: value)));
        });
      },
      child: const Text("Simpan Perubahan"));
}
