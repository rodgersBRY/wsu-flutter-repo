import 'dart:convert';

import '../utils/app_constants.dart';

import '../models/user.model.dart';
import 'package:http/http.dart' as http;

class UserController {
  List<User> users = [];

  Future<List<User>> getUsers() async {
    try {
      // make the get request to the api endpoint
      http.Response response = await http.get(Uri.parse(AppConstants.baseUrl));

      if (response.statusCode == 200) {
        // convert the response to a json object
        var jsonData = json.decode(response.body);

        // assign the response to the users list
        users = List<User>.generate(jsonData['users'].length,
            (index) => User.fromJson(jsonData['users'][index]));
      }

      return users;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future deleteUser(String userId) async {
    try {
      http.Response response =
          await http.delete(Uri.parse("${AppConstants.baseUrl}/$userId"));

      if (response.statusCode == 204) {
        return "success";
      } else {
        return "fail";
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  Future addUser({required User user}) async {
    try {
      final resp = await http.post(
        Uri.parse("${AppConstants.baseUrl}/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "firstName": user.firstName,
          "lastName": user.lastName,
          "email": user.email,
        }),
      );

      return resp.statusCode;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future editUser({required User user, required String userId}) async {
    try {
      final resp = await http.put(
        Uri.parse("${AppConstants.baseUrl}/$userId"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "firstName": user.firstName,
          "lastName": user.lastName,
          "email": user.email,
        }),
      );

      if (resp.statusCode == 201) {
        return "success";
      } else {
        return "fail";
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
