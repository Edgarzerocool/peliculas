import 'package:flutter/material.dart';

class presentacion extends StatefulWidget {
  const presentacion({Key? key}) : super(key: key);

  @override
  State<presentacion> createState() => _presentacionState();
}

class _presentacionState extends State<presentacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
      ),
      body: const Text("Saludos"),

    );
  }
}
