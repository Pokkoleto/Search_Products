import 'package:flutter/material.dart';

class Product {
  String title;
  String aliasTitle;
  String barcode;
  String sku;
  double price;
  int remainInStock;

  Product(
      {required this.title,
      required this.aliasTitle,
      required this.barcode,
      required this.sku,
      required this.price,
      required this.remainInStock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'],
        aliasTitle: json['aliasTitle'],
        barcode: json['barcode'],
        sku: json['sku'],
        price: json['price'],
        remainInStock: json['remainInStock']);
  }
}
