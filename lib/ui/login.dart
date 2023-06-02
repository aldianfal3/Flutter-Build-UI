import 'package:aldi/widget/loadingScreen.dart';
import 'package:aldi/ui/beranda.dart';
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
                        _tombolLogin(_loginCtrl, context),
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
    decoration: InputDecoration(labelText: "Username"),
    controller: _usernameCtrl,
  );
}

Widget _passwordTextField(TextEditingController _passwordCtrl) {
  return TextFormField(
    decoration: InputDecoration(labelText: "Password"),
    controller: _passwordCtrl,
  );
}

Widget _tombolLogin(TextEditingController _loginCtrl, context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => loadingSreen()),
                (Route<dynamic> route) => false);
          }));
}
