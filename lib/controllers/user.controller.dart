import '../models/user.model.dart';

class UserController {
  List<User> users = [];

  Future<List<User>> getUsers() async {
    try {
      return users;
    } catch (err) {
      throw Exception(err);
    }
  }
}
