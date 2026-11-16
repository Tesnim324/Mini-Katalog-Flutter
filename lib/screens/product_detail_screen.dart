import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_data.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool get isAddedToCart => isInCart(widget.product);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Detayı'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 280,
                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 60),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '${product.price.toStringAsFixed(2)} TL',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Kategori: ${product.category}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            const Text(
              'Ürün Açıklaması',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
               onPressed: () {
  setState(() {
    if (isInCart(product)) {
      removeFromCart(product);
    } else {
      addToCart(product);
    }
  });
},
                icon: Icon(
                  isAddedToCart
                      ? Icons.check_circle
                      : Icons.shopping_cart,
                ),
                label: Text(
                  isAddedToCart
                      ? 'Sepete Eklendi'
                      : 'Sepete Ekle',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}