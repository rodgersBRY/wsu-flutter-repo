import 'package:flutter/material.dart';

import '../widgets/server-health-widget.dart';
import '../widgets/user-screen-widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WSU-GH'),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            tabs: [
              Tab(
                text: "Server Health",
                icon: Icon(Icons.dataset_outlined),
              ),
              Tab(
                text: "Users",
                icon: Icon(Icons.supervised_user_circle),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ServerHealthWidget(),
            UserScreenWidget(),
          ],
        ),
      ),
    );
  }
}
