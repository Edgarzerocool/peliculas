import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/Utils/funciones.dart';
import 'package:peliculas/Utils/usuarios.dart';

class OtraVista extends StatefulWidget {
  Usuario usuarioLogeado;
  OtraVista({Key? key, required this.usuarioLogeado}) : super(key: key);

  @override
  State<OtraVista> createState() => _OtraVistaState();
}

class _OtraVistaState extends State<OtraVista> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool mostrarAlerta =false;

  @override
  Widget build(BuildContext context) {
    Usuario usuario= widget.usuarioLogeado;
    emailController.text = emailController.value.text != "" ? emailController.text : usuario.email;
    passwordController.text = passwordController.value.text != "" ? passwordController.text : usuario.password;
    return Scaffold(
      appBar: AppBar(title: Text(usuario.nombre.substring(0,buscarPosicionCaracter(usuario.nombre," "))),),
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Text("Cambiar datos:"),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email_outlined)),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.password)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton(
                    onPressed: (){
                      cambiarDatos(emailController.text, passwordController.text, usuario);
                      mostrarAlerta = true;
                      },
                    color: Colors.blue,
                    child: const Text("Editar"),
                  ),
                ),
                Visibility(
                  visible: mostrarAlerta,
                  child: AlertDialog(
                    title: const Text("Datos modificados"),
                    content: const Text("Desea salir?"),
                    actions: [
                      ElevatedButton(onPressed: (){
                        mostrarAlerta = false;
                        Navigator.pop(context);
                      }, child: const Text('Aceptar')),
                      ElevatedButton(onPressed: (){
                        mostrarAlerta = false;
                        setState(() {
                          
                        });
                      }, child: const Text('Cancelar')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void cambiarDatos(String email, String password, Usuario usuario) {
    usuarios[usuarios.indexWhere((element) => element.nombre == usuario.nombre)] = Usuario(email, password, usuario.nombre);
    setState(() {

    });
  }
}

