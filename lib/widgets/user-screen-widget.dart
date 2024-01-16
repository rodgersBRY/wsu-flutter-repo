import 'package:flutter/material.dart';
import 'package:wsu_flutter/pages/new-edit-user.dart';

import '../controllers/user.controller.dart';
import '../models/user.model.dart';
import '../pages/user-details-page.dart';

class UserScreenWidget extends StatefulWidget {
  const UserScreenWidget({super.key});

  @override
  State<UserScreenWidget> createState() => _UserScreenWidgetState();
}

class _UserScreenWidgetState extends State<UserScreenWidget> {
  late Future usersFuture;
  final usersController = UserController();

  @override
  void initState() {
    super.initState();

    usersFuture = usersController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: usersFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                default:
                  if (snapshot.hasError) {
                    return const Expanded(
                      child: Center(
                        child: Text("An error has occurred!"),
                      ),
                    );
                  } else {
                    List<User> users = snapshot.data!;

                    if (users.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text("There are no users on the system"),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text("${index + 1}"),
                              title: Text(
                                  "${users[index].firstName} ${users[index].lastName}"),
                              subtitle: Text(users[index].email),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailsPage(user: users[index]),
                                ));
                              },
                            );
                          },
                        ),
                      );
                    }
                  }
              }
            }),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton.extended(
                label: const Text("Add User"),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const NewEditUser()));
                },
                icon: const Icon(Icons.add),
              ),
            ))
      ],
    );
  }
}
