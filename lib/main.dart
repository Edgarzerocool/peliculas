import 'package:flutter/material.dart';
import 'package:peliculas/Utils/usuarios.dart';
import 'presentacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Practica Peliculas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool mostrarTextoError = false;
  late Usuario usuarioLogeado;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children:  [
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      label: Text("correo"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      label: Text("contrase??a"),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  Visibility(visible: mostrarTextoError,child: const Text("datos incorrectos")),
                  OutlinedButton(
                    onPressed: (){
                      bool respuesta = validarDatos(email.value.text,password.value.text);
                      if(respuesta){
                        mostrarTextoError = false;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Presentacion(usuarioLogeado: usuarioLogeado)),);
                      }else{
                        mostrarTextoError = true;
                      }
                      setState(() {
                      });
                    },
                    child: const Text("Ingresar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool validarDatos(String email, String password) {
    bool existe = false;
    for (var element in usuarios) {
      if(element.email == email && element.password == password){
        usuarioLogeado = element;
        existe =  true;
      }
    }
    return existe;
  }
}
