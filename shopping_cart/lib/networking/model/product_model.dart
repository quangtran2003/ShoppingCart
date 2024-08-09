// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String? image;
  String? name;
  int? price;
  int? id;
  bool? isHot;
  int? quantityInCart;

  Product({
    this.image,
    this.name,
    this.price,
    this.id,
    this.isHot,
    this.quantityInCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"],
        name: json["name"],
        price: json["price"],
        id: json["id"],
        isHot: json["isHot"],
        quantityInCart: json["quantityInCart"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": price,
        "id": id,
        "isHot": isHot,
        "quantityInCart": quantityInCart,
      };
}
