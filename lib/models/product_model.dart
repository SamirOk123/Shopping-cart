class Product {
  final String name;
  final double price;
  final String imagePath;

  Product({required this.imagePath, required this.name, required this.price});
}

//List of products
List<Product> products = [
  Product(imagePath: 'assets/products/img1.png', name: 'Hoodie', price: 69.95),
  Product(
      imagePath: 'assets/products/img2.png',
      name: 'Cocktail dress',
      price: 100.25),
  Product(imagePath: 'assets/products/img3.png', name: 'T shirt', price: 45.95),
  Product(imagePath: 'assets/products/img4.png', name: 'T shirt', price: 30.90),
  Product(
      imagePath: 'assets/products/img5.png',
      name: 'Casual shirt',
      price: 69.95),
  Product(
      imagePath: 'assets/products/img6.png',
      name: 'Cocktail dress',
      price: 90.95),
  Product(imagePath: 'assets/products/img7.png', name: 'Hoodie', price: 69.95),
  Product(
      imagePath: 'assets/products/img8.png',
      name: 'Bomber Jacket',
      price: 49.55),
  Product(imagePath: 'assets/products/img9.png', name: 'T shirt', price: 29.35),
  Product(
      imagePath: 'assets/products/img10.png',
      name: 'Bomber Jacket',
      price: 99.15),
];
