import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(url: product.picture),
            _ProductDetails(
              id: product.id,
              name: product.name,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(
                  price: product.price,
                )),
            //  TODO: Mostrar de manera opcional
            if (!product.available)
              const Positioned(top: 0, left: 0, child: _NotAvailable())
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: _availableDecoration(),
      child: const FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
                child: Text(
              'No disponible',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          )),
    );
  }

  BoxDecoration _availableDecoration() => const BoxDecoration(
      color: Color.fromARGB(255, 119, 108, 8),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({Key? key, required this.price}) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: _priceTagDecoration(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$ $price',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  BoxDecoration _priceTagDecoration() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.name, this.id});

  final String? id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(id!, style: const TextStyle(fontSize: 15, color: Colors.white))
        ]),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ));
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
