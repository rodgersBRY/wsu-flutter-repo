import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "Server health unknown yet!";
  bool loading = false;

  // method to fetch api health using http package
  Future loadServerHealth() async {
    try {
      setState(() {
        loading = true;
      });

      final response =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/health"));

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

    // Print debug statement
    print("Loading status: $loading");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All users'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: loading
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
          ),
          Expanded(child: Container()),
          Center(
            child: ElevatedButton(
              onPressed: loadServerHealth,
              child: const Text("Load Server Health"),
            ),
          )
        ],
      ),
    );
  }
}
