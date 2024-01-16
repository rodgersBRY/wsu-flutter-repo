import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user.controller.dart';
import '../models/user.model.dart';
import '../widgets/custom-textfield.dart';
import './home.dart';

class NewEditUser extends StatefulWidget {
  const NewEditUser({super.key});

  @override
  State<NewEditUser> createState() => _NewEditUserState();
}

class _NewEditUserState extends State<NewEditUser> {
  final userController = UserController();
  bool loading = false;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();

  final _fnameFocus = FocusNode();
  final _lnameFocus = FocusNode();
  final _emailFocus = FocusNode();

  saveUser() async {
    var user = {
      "firstName": _fnameController.text.trim(),
      "lastName": _lnameController.text.trim(),
      "email": _emailController.text.trim(),
    };

    await userController.addUser(user: User.fromJson(user));
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("New User details"),
            const SizedBox(height: 5),
            customTextField(
              labelText: "First Name",
              textEditingController: _fnameController,
              focusNode: _fnameFocus,
            ),
            customTextField(
              labelText: "Last Name",
              textEditingController: _lnameController,
              focusNode: _lnameFocus,
            ),
            customTextField(
              labelText: "Email",
              textEditingController: _emailController,
              focusNode: _emailFocus,
            ),
            ElevatedButton(
              onPressed: saveUser,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
