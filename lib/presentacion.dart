import 'package:flutter/material.dart';
import 'package:peliculas/Utils/usuarios.dart';

class presentacion extends StatelessWidget{
  final Usuario usuarioLogeado;
  presentacion({Key? key, required this.usuarioLogeado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
      ),
      body: Text(usuarioLogeado.toString()),
    );
  }
}
