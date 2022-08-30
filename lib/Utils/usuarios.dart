class Usuario {
  String email = "";
  String password = "";

  Usuario(this.email, this.password);

  @override
  String toString() {
    return "email: $email , password: $password";
  }
}
