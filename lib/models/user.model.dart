
class User {
    String firstName;
    String lastName;
    String email;

    User({
        required this.firstName,
        required this.lastName,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
    );
}
