class Usuario {
  String email = "";
  String password = "";

  Usuario(this.email, this.password);

  @override
  String toString() {
    return "email: $email , password: $password";
  }
}

List usuarios = [
  Usuario("egonzalez@mainbit.com.mx", "123abc"),
  Usuario("mjimenez@mainbit.com.mx", "mainbit")
];
