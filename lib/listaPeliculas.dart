import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/Modelos/reproducida.dart';
import 'package:peliculas/Utils/funciones.dart';

class ListaPeliculas extends StatefulWidget {
  const ListaPeliculas({Key? key}) : super(key: key);

  @override
  State<ListaPeliculas> createState() => ListaPeliculasState();
}

class ListaPeliculasState extends State<ListaPeliculas> {
  bool finalizoServicio = false;
  Playing listaVaciaPlaying = Playing(dates: null, page: 0, results: null);
  Playing lista = Playing(dates: null, page: 0, results: null);

  @override
  Widget build(BuildContext context) {
    if(finalizoServicio == false){recuperarLista().then((val) => setState((){
      lista = val;
      finalizoServicio = true;
    }));}
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Peliculas"),
      ),
      body:
        Column(
          children: [
          lista.results == null ?
            const Text("No ahy datos para mostrar") :
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: lista.results?.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  title: Text(lista.results![i].title.toString()),
                  subtitle: const Text("Ver mas detalles"),
                );
              },
            ),
          ),

          ],
      ),
    );
  }

  Future<Playing> recuperarLista() async {
    Playing respuesta;
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKeyPeliculas&language=es-MX&page=1'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      respuesta =  Playing.fromJson(jsonDecode(response.body));
      return respuesta;
    } else {
      // If the server did not return a 200 OK response,
      return listaVaciaPlaying;
    }
  }
}
