import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/pages/auth.dart';
import 'package:messenger/pages/welcome.dart';
import 'package:messenger/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      routes: {
        '/': (context) => const WelcomePage(),
        '/auth': (context) => const AuthPage()
      },
    );
  }
}
