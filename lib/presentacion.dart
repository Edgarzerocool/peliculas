import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/Utils/usuarios.dart';
import 'package:peliculas/Utils/funciones.dart';

class presentacion extends StatelessWidget{
  final Usuario usuarioLogeado;
  bool mostrarAlerta = false;
  TextEditingController campoCorreo = TextEditingController();
  TextEditingController campoPassword = TextEditingController();
  presentacion({Key? key, required this.usuarioLogeado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    campoCorreo.text = campoCorreo.value.text == null ? "fui" : usuarioLogeado.email;
    campoPassword.text = campoPassword.value.text == null ? "fui" : usuarioLogeado.password;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido ${usuarioLogeado.nombre.substring(0,buscarPosicionCaracter(usuarioLogeado.nombre, " "))}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
             const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Cambiar tus datos"),
            ),
            TextFormField(
              controller: campoCorreo,
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email),
              ),
            ),
            TextFormField(
              controller: campoPassword,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  mostrarAlerta = buscarReemplazar(campoCorreo.text,campoPassword.text,usuarioLogeado.nombre,usuarioLogeado.email);
                }, child: Text("Modificar"),
              ),
            ),
            Visibility(
              visible: mostrarAlerta,
              child: const AlertDialog(
                title: Text("Datos modificados"),
                actions: [
                  ElevatedButton(onPressed: null, child: const Text('Button 1')),
                  ElevatedButton(onPressed: null, child: const Text('Button 2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool buscarReemplazar(String campoCorreo, String campoPassword, String nombre, String correoActual) {
    usuarios[usuarios.indexWhere((element) => element.email == correoActual)] = Usuario(campoCorreo, campoPassword, nombre);
    return true;
  }
}
