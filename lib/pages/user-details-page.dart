// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wsu_flutter/pages/new-edit-user.dart';

import '../controllers/user.controller.dart';
import '../models/user.model.dart';
import '../pages/home.dart';

class UserDetailsPage extends StatefulWidget {
  User user;

  UserDetailsPage({required this.user, super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final userController = UserController();

  deleteUser() async {
    var resp = await userController.deleteUser(widget.user.id!);

    if (resp == "success") {
      Get.snackbar(
        "Success",
        "User has been deleted",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    } else {
      Get.snackbar(
        "Error",
        "Failed to delete user",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewEditUser(user: widget.user),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => deleteUser(),
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
