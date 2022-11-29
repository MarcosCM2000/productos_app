import 'package:flutter/material.dart';

class AuthBackgound extends StatelessWidget {
  const AuthBackgound({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 254, 254),
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [_PurpleBox(), _HeaderIcon(), this.child]),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(children: const [
        Positioned(top: 90, left: 30, child: _Bubble()),
        Positioned(top: 45, right: 30, child: _Bubble()),
        Positioned(top: 200, left: 200, child: _Bubble()),
        Positioned(
          bottom: 100,
          right: 30,
          child: _Bubble(),
        ),
        Positioned(
          bottom: 75,
          left: 30,
          child: _Bubble(),
        )
      ]),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.yellow, Colors.red, Colors.indigo, Colors.teal]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: 200,
      child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
    ));
  }
}
