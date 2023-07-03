import 'package:aldi/helpers/user_info.dart';
import 'package:aldi/main.dart';
import 'package:aldi/service/login_service.dart';
import 'package:aldi/widget/loadingScreen.dart';
import 'package:aldi/ui/beranda.dart';
import 'package:aldi/widget/loadingScreen2.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _loginCtrl = TextEditingController();
  final text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle_outlined,
                size: 90,
              ),
              const Text("LOGIN ACCOUNT",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 50),
              Center(
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      children: [
                        _usernameTextField(_usernameCtrl),
                        SizedBox(height: 20),
                        _passwordTextField(_passwordCtrl),
                        SizedBox(height: 40),
                        _tombolLogin(
                            _loginCtrl, context, _usernameCtrl, _passwordCtrl),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

Widget _usernameTextField(TextEditingController _usernameCtrl) {
  return TextFormField(
    decoration: InputDecoration(labelText: "username"),
    controller: _usernameCtrl,
  );
}

Widget _passwordTextField(TextEditingController _passwordCtrl) {
  return TextFormField(
    decoration: InputDecoration(labelText: "password"),
    controller: _passwordCtrl,
  );
}

Widget _tombolLogin(
    TextEditingController _loginCtrl, context, _usernameCtrl, _passwordCtrl) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            await LoginService().login(username, password).then((value) {
              if (value == true) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loadingSreen()));
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: const Text("Username atau Password Tidak Valid"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => alertDialog);
              }
            });
          }));
}
