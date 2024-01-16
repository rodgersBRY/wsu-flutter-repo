// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wsu_flutter/controllers/user.controller.dart';

import '../models/user.model.dart';

class UserDetailsPage extends StatefulWidget {
  User user;

  UserDetailsPage({required this.user, super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final userController = UserController();

  deleteUser() {
    print("delete user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.4),
        foregroundColor: Colors.white,
        title: Text(widget.user.firstName),
        actions: [
          IconButton(
            onPressed: () {
              print("editing user");
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: deleteUser,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_2,
              size: 120,
            ),
            Text(
              "${widget.user.firstName} ${widget.user.lastName}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              widget.user.email,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
