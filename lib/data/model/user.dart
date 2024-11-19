class User {
  final int id;
  final String email;
  final String name;
  final String token;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.token});
  factory User.fromJson(json) {
    return User(
        id: json['user']['id']??0,
        email: json['user']['email'],
        name: json['user']['name']??"",
        token: json['Token']);
  }

  toJson() {
    return {"id": id, "email": email, "token": token, "name": name};
  }
}
