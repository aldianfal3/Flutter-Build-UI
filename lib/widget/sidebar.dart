import 'package:aldi/model/poli.dart';
import 'package:aldi/ui/poli_detail.dart';
import 'package:aldi/service/poli_service.dart';
import 'package:aldi/ui/poli_detail.dart';
import 'package:aldi/ui/poli_form.dart';
import 'package:aldi/ui/poli_item.dart';
import 'package:aldi/widget/loadingScreen3%20copy.dart';
import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/poli_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("adminanfal3@gmail.com")),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessibility_sharp),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => poliPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("Keluar"),
              onTap: () {
                AlertDialog alertDialog = AlertDialog(
                  content: Text("LOGOUT!!!!"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loadingSreen3()));
                      },
                      child: Text("Ya"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Tidak"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => alertDialog);
              })
        ],
      ),
    );
  }
}
