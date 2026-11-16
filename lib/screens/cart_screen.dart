import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = widget.cartItems.fold(
      0,
      (sum, product) => sum + product.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Sepetiniz boş 🛒',
                style: TextStyle(fontSize: 22),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = widget.cartItems[index];

                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.asset(
                            product.imageUrl,
                            width: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image);
                            },
                          ),
                          title: Text(product.name),
                          subtitle: Text(
                            '${product.price.toStringAsFixed(2)} TL',
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Toplam: ${total.toStringAsFixed(2)} TL',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}