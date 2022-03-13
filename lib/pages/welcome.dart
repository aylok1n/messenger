import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/welcome.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.center),
            ),
          ),
          const Spacer(flex: 3),
          Text(
            "Welcome to $appName",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            "Заходи не бойся - выходи не плачь.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.64),
            ),
          ),
          const Spacer(flex: 3),
          FittedBox(
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/auth'),
                child: Row(
                  children: [
                    Text(
                      "Погнали",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.8),
                          ),
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.8),
                    )
                  ],
                )),
          ),
          const Spacer(flex: 1)
        ],
      ),
    ));
  }
}
