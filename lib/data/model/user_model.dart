class UserModel {
  final int id;
  final String email;
  final String name;
  final String role;

  UserModel(
      {required this.id,
        required this.email,
        required this.name,
        required this.role});
  factory UserModel.fromJson(json) {
    return UserModel(
        id: json['id']??0,
        email: json['email'],
        name: json['name']??"",
        role: json['role']);
  }


}
