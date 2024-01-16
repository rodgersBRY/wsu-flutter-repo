import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constants.dart';

class ServerHealthWidget extends StatefulWidget {
  const ServerHealthWidget({super.key});

  @override
  State<ServerHealthWidget> createState() => _ServerHealthWidgetState();
}

class _ServerHealthWidgetState extends State<ServerHealthWidget> {
  String message = "Server health unknown yet!";
  bool loading = false;

  // method to fetch api health using http package
  Future loadServerHealth() async {
    try {
      setState(() {
        loading = true;
      });

      final response =
          await http.get(Uri.parse("${AppConstants.baseUrl}/api/health"));

      var jsonData = json.decode(response.body);

      setState(() {
        message = jsonData['message'];
      });
    } catch (err) {
      setState(() {
        message = "Unable to connect to server";
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loading
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : Text(
                  message,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: loadServerHealth,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.green.withOpacity(.4)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text("Load Server Health"),
          )
        ],
      ),
    );
  }
}