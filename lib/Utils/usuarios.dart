class Usuario {
  String email = "";
  String password = "";
  String nombre = "";

  Usuario(this.email, this.password, this.nombre);

  @override
  String toString() {
    return "nombre: $nombre, email: $email , password: $password";
  }
}

List usuarios = [
  Usuario("egonzalez@mainbit.com.mx", "123abc","Edgar Gonzalez"),
  Usuario("mjimenez@mainbit.com.mx", "mainbit", "Martin Jimenez")
];
