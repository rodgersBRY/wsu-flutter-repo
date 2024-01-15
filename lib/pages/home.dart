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
  
  // method to fetch api health using http package
  Future loadServerHealth() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/health"));

      var jsonData = json.decode(response.body);

      setState(() {
        message = jsonData.message;
      });
    } catch (err) {
      throw Exception(err);
    }
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
          Text(message),
          Expanded(child: Container()),
          TextButton(
            onPressed: loadServerHealth,
            child: const Text("Load Server Health"),
          )
        ],
      ),
    );
  }
}
