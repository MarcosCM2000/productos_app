import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Productos'),
      )),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'product'),
                child: const ProductCard(),
              ))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
