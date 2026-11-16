import '../models/product.dart';

// Uygulamanın ortak sepet listesi
final List<Product> cartItems = [];

// Sepete ürün ekleme
void addToCart(Product product) {
  if (!cartItems.any((item) => item.id == product.id)) {
    cartItems.add(product);
  }
}

// Sepetten ürün kaldırma
void removeFromCart(Product product) {
  cartItems.removeWhere((item) => item.id == product.id);
}

// Sepette ürün var mı?
bool isInCart(Product product) {
  return cartItems.any((item) => item.id == product.id);
}