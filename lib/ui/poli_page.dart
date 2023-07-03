import 'package:aldi/model/poli.dart';
import 'package:aldi/service/poli_service.dart';
import 'package:aldi/ui/poli_detail.dart';
import 'package:aldi/ui/poli_form.dart';
import 'package:flutter/material.dart';
import 'poli_item.dart';
import 'package:aldi/widget/sidebar.dart';

class poliPage extends StatefulWidget {
  const poliPage({Key? key}) : super(key: key);

  @override
  State<poliPage> createState() => _poliPageState();
}

class _poliPageState extends State<poliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoliForm()));
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            else if  (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
           else if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Text("Data Kosong");
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Poliitem(poli: snapshot.data[index]);
              },
            );
          },
        ));
  }
}
