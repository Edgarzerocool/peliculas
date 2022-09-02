import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/Utils/usuarios.dart';
import 'package:peliculas/listaPeliculas.dart';
import 'package:peliculas/otravista.dart';

class Presentacion extends StatelessWidget{
  final Usuario usuarioLogeado;
  const Presentacion({Key? key, required this.usuarioLogeado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bienvenido ${usuarioLogeado.nombre}"),
                IconButton(color: Colors.white, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtraVista(usuarioLogeado: usuarioLogeado)),);
                }, icon: const Icon(Icons.person_pin)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
            const Text("Elige el catalogo de peliculas que deseas ver:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPeliculas()));
                }, child: const Text("Más Vistas"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPeliculas()));
                }, child: const Text("Más Populares"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
