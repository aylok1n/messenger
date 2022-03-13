import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _email = '';
  String _name = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = <Tab>[
      const Tab(
        child: Text(
          'Авторизация',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const Tab(
        child: Text(
          'Регистрация',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ];

    final _tabsContent = <Widget>[
      Center(
        child: Column(
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            )
          ],
        ),
      ),
      const Text('data')
    ];

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Odnogryppniki',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25)),
            backgroundColor: const Color.fromRGBO(38, 38, 38, 0.7),
            centerTitle: true,
            bottom: TabBar(tabs: _tabs),
          ),
          body: TabBarView(
            children: _tabsContent,
          ),
        ));
  }
}
