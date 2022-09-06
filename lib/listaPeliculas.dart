import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/Modelos/popular.dart';
import 'package:peliculas/Modelos/reproducida.dart';
import 'package:peliculas/Utils/funciones.dart';
import 'package:peliculas/detallePelicula.dart';

class ListaPeliculas extends StatefulWidget {
  String tipo;

  ListaPeliculas({Key? key, required this.tipo}) : super(key: key);

  @override
  State<ListaPeliculas> createState() => ListaPeliculasState();
}

class ListaPeliculasState extends State<ListaPeliculas> {
  bool finalizoServicio = false;
  Playing listaVaciaPlaying = Playing(dates: null, page: 0, results: null);
  Playing listaPlaying = Playing(dates: null, page: 0, results: null);
  Popular listaVaciaPopular = Popular(page: 0, results: null, totalPages: 0, totalResults: 0);
  Popular listaPopular = Popular(page: 0, results: null, totalPages: 0, totalResults: 0);

  @override
  Widget build(BuildContext context) {
    if(finalizoServicio == false){
      if(widget.tipo == "Más Vistas"){
        recuperarListaPlaying().then((val) => setState((){
          listaPlaying = val;
          finalizoServicio = true;
        }));
      }else{
        recuperarListaPopular().then((val) => setState((){
          listaPopular = val;
          finalizoServicio = true;
        }));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas ${widget.tipo}"),
      ),
      body:
        Column(
          children: [
            finalizoServicio == false ?
            const Text("No ahy datos para mostrar") :
            widget.tipo == "Más Vistas" ? generarListaPlaying(listaPlaying) :  generarListaPopular(listaPopular),
          ],
      ),
    );
  }

  Widget generarListaPopular(Popular lista){
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: lista.results?.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(color: i%2 == 0 ? Colors.deepOrange : Colors.amberAccent),
            child: ListTile(
              title: Text(lista.results![i].title.toString()),
              subtitle: const Text("Ver mas detalles"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePelicula(result: lista.results![i])));
              },
            ),
          );
        },
      ),
    );
  }

  Widget generarListaPlaying(Playing lista){
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: lista.results?.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(color: i%2 == 0 ? Colors.deepOrange : Colors.amberAccent),
            child: ListTile(
              title: Text(lista.results![i].title.toString()),
              subtitle: const Text("Ver mas detalles"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePelicula(result: lista.results![i])));
              },
            ),
          );
        },
      ),
    );
  }

  Future<Playing> recuperarListaPlaying() async {
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

  Future<Popular> recuperarListaPopular() async {
    Popular respuesta;
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKeyPeliculas&language=es-MX&page=1'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      respuesta =  Popular.fromJson(jsonDecode(response.body));
      return respuesta;
    } else {
      // If the server did not return a 200 OK response,
      return listaVaciaPopular;
    }
  }
}
