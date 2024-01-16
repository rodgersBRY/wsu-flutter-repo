class User {
  String id;
  String firstName;
  String lastName;
  String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
      );
}
