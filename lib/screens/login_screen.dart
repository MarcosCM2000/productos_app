import 'package:flutter/material.dart';
import './../widgets/widgets.dart';
import './../ui/input_decorations.dart';

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
              const _LoginForm()
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Crear cuenta nueva',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),
        ]),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          //  TODO: mantener la referencia al key
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_outlined),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                //  TODO: Login form
              })
        ],
      )),
    );
  }
}
