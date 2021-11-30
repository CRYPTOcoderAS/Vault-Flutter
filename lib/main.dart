import 'package:flutter/material.dart';
import 'package:passvault/db/user_database.dart';
import 'package:passvault/getStartedScreen/first_screen.dart';
import 'package:passvault/getStartedScreen/second_screen.dart';
import 'package:passvault/screens/home_screen.dart';
import 'package:passvault/screens/login_screen.dart';

import 'model/user_info_model.dart';

const Color accent = Color(0xFFD50000);
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<User> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.users = await UserDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager',
      home: users.length == 0
          ? FirstScreen()
          : users[0].loginRequired
              ? LoginScreen()
              : HomeScreen(),
    );
  }
}
