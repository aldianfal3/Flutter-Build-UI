import 'package:aldi/service/poli_service.dart';
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
  Stream<Poli> getData() async* {
  Poli data = await PoliService().getById(widget.poli.id.toString());
  yield data;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:
    AppBar(title: const Text("Detail Poli")),
    body:
    StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("snapshot.error.toString()");
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return const Text("Data Tidak Ditemukan");
          }
          return Column(
            children: [
             const SizedBox(
                height: 20,
              ),
              Text(
                "Nama Poli : ${snapshot.data.namaPoli}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tombolUbah(_namaPoliCtrl, context, getData()),
                  _tombolHapus(_namaPoliCtrl, context, getData(), ElevatedButton)
                ],
              )
            ],
          );
        }
        ),
      );
  }
}



_tombolUbah(TextEditingController _namaPoliCtrl, context, getData) {
  return StreamBuilder(
    stream: getData(),
     builder: (context,AsyncSnapshot snapshot) => ElevatedButton(
    onPressed: () {
    Navigator.push(
      context, 
    MaterialPageRoute(builder: (context) => 
    PoliUpdateForm(poli: snapshot.data)));   
   },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah")));
}

_tombolHapus(TextEditingController _namaPoliCtrl, context, getData, ElevatedButton) {
  return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Anda Yakin ingin menghapus data ini?!!"),
          actions: [
            StreamBuilder(
              stream: getData(),
             builder: (context, AsyncSnapshot snapshot) => ElevatedButton
             ( onPressed: () async {
              await PoliService()
              .hapus(snapshot.data)
              .then((value) {
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => poliPage()));
              });
             },
              child: const Text("ya"),
              style: ElevatedButton.styleFrom(primary: Colors.red)
             )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"));
}
