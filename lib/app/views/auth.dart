import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/services/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthService authService = AuthService();

  String _email = '';
  String _name = '';
  String _password = '';
  bool _showPassword = false;

  Future<void> auth() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      var res = await authService.login(_email, _password);
      print(res);
    }
  }

  Future<void> register() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      var res = await authService.register(_email, _name, _password);
      print(res);
    }
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const Spacer(flex: 1),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color!,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Ваш Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 0.0)),
            TextField(
              textInputAction: TextInputAction.done,
              obscureText: !_showPassword,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color!,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: _showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword)),
                labelText: "Пароль",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 0.0)),
            ElevatedButton(
              child: const Text('Войти'),
              onPressed: auth,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const Spacer(flex: 1),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color!,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Ваш Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 0.0)),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color!,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.people_outline),
                labelText: "Имя",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 0.0)),
            TextField(
              obscureText: !_showPassword,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color!,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: _showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword)),
                labelText: "Пароль",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 0.0)),
            ElevatedButton(
              child: const Text('Регистрация'),
              onPressed: register,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
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
