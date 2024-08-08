// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/user_card.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../models/user.dart';
import '../provider/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 17, 58),
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : userProvider.errorMessage != null
                ? Center(child: Text(userProvider.errorMessage!))
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      User user = userProvider.users[index];
                      int n = Random().nextInt(4) + 1;
                      return user_card(
                        imagePath: 'assets/images/${n}.png',
                        user: user,
                      );
                    }),
      ),
    );
  }
}
