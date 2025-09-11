import 'package:flutter/material.dart';
import 'package:flutter_project_digiscia/chat.page.dart';
import 'package:flutter_project_digiscia/contact.page.dart';
import 'package:flutter_project_digiscia/experts_list.page.dart';
import 'package:flutter_project_digiscia/home.page.dart';
import 'package:flutter_project_digiscia/welcome.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/welcome': (context) => WelcomePage(),
        '/chat': (context) => ChatPage(),
        '/contact': (context) => ContactPage(),
        "/experts_list": (context) => ExpertsListPage(),
      },
      theme: ThemeData(primaryColor: Colors.teal, indicatorColor: Colors.white),
    );
  }
}
