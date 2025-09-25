// Base Class - Demonstrasi Inheritance dan Polymorphism
class Product {
  String name;
  int price;

  Product(this.name, this.price);

  String getInfo() {
    return "$name - Rp $price";
  }
}
