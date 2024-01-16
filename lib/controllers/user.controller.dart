import 'dart:convert';

import '../utils/app_constants.dart';

import '../models/user.model.dart';
import 'package:http/http.dart' as http;

class UserController {
  List<User> users = [];

  Future<List<User>> getUsers() async {
    try {
      http.Response response = await http.get(Uri.parse(AppConstants.baseUrl));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        users = List<User>.generate(jsonData['users'].length,
            (index) => User.fromJson(jsonData['users'][index]));
      }

      return users;
    } catch (err) {
      throw Exception(err);
    }
  }

}
