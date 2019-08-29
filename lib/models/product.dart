class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double discount;
  Product(this.id, this.name, this.description, this.imageUrl, this.price,
      this.discount);
}

List<Product> products = [
  Product(1, "shoe 1", "this is shoe 1", "images/img.jpg", 100.50, 0.0),
  Product(2, "shoe 2", "this is shoe 2", "images/img2.jpg", 99.50, 20.0),
  Product(3, "shoe 3", "this is shoe 3", "images/img3.jpg", 89.50, 10.0),
  Product(4, "shoe 4", "this is shoe 4", "images/img4.jpg", 210.50, 5.5),
  Product(5, "shoe 5", "this is shoe 5", "images/img5.jpg", 210.50, 6.3),
  Product(6, "shoe 6", "this is shoe 6", "images/img6.jpg", 210.50, 5.6),
  Product(7, "shoe 7", "this is shoe 4", "images/bg1.jpg", 210.50, 8.0),
  Product(8, "shoe 8", "this is shoe 4", "images/bg2.jpg", 210.50, 10.2),
  Product(9, "shoe 9", "this is shoe 4", "images/bg3.jpg", 210.50, 5.7),
  Product(10, "shoe 10", "this is shoe 4", "images/img4.jpg", 210.50, 4.8),
  Product(11, "shoe 11", "this is shoe 4", "images/img3.jpg", 210.50, 3.0),
  Product(12, "shoe 12", "this is shoe 4", "images/img2.jpg", 210.50, 5.7)
];
