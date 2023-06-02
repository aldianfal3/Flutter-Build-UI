import 'package:flutter/material.dart';

class helloWorld extends StatelessWidget {
  const helloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Application I-Chat"),
          backgroundColor: Color.fromARGB(255, 37, 33, 243)),
      body: const Row(
        children: [
          Text("Kolom 1"),
          Text("Kolom 2"),
          Text("Kolom 3"),
          Text("Kolom 4"),
          Text("Kolom 5"),
          Text("Kolom 6"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.ac_unit_outlined),
      ),
    );
  }
}
