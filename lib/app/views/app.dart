import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/app/views/auth.dart';
import 'package:messenger/app/views/welcome.dart';
import 'package:messenger/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
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