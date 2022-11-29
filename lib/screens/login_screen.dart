import 'package:flutter/material.dart';
import './../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgound(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 250,
          ),
          CardContainer(
            child: Column(children: [
              const SizedBox(height: 10),
              Text('LOGIN', style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 30),
              const Text('FORM')
            ]),
          )
        ]),
      )),
    );
  }
}
