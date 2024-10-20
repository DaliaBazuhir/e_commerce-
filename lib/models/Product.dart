// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);
//
// import 'dart:convert';
// import 'package:e_commerce/models/Category.dart';
// List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
//
// String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Product {
//   int id;
//   String title;
//   double price;
//   String description;
//   List<String> images;
//   DateTime creationAt;
//   DateTime updatedAt;
//   // Category category;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.images,
//     required this.creationAt,
//     required this.updatedAt,
//     // required this.category,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"],
//     description: json["description"],
//     images: List<String>.from(json["images"].map((x) => x)),
//     creationAt: DateTime.parse(json["creationAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//      // category: Category.fromJson(json["category"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "price": price,
//     "description": description,
//     "images": List<dynamic>.from(images.map((x) => x)),
//     "creationAt": creationAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//      // "category": category.toJson(),
//   };
// }
//
// class Category{
//
// }
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  // Factory constructor to create a Product object from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
