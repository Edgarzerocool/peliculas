import 'package:flutter/material.dart';
import 'package:peliculas/Modelos/result.dart';

class DetallePelicula extends StatelessWidget {
  Results result;

  DetallePelicula({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fecha de lanzamiento: ${result.releaseDate}"),
                  Text("Idioma original: ${result.originalLanguage}"),
                ],
              ),
            ),
            Image(
              image: NetworkImage('https://image.tmdb.org/t/p/original${result.posterPath}'),
            )
          ],
        ),
      ),
    );
  }
}
