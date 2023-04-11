import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
// import 'package:flutter/material.dart';
import 'search_model.dart';
// import 'map_id.dart';

Future<List<Product>> loadListOfProduct() async {
  String jsonString = await rootBundle.loadString('assets/SKU.json');
  final jsonData = json.decode(jsonString);
  List<Product> tmp =
      List<Product>.from(jsonData.map((json) => Product.fromJson(json)));
  return tmp;
}

Map<String, dynamic> mapBarcode = {};
Map<String, dynamic> mapSku = {};

void createMap(List<Product> data) {
  for (int i = 0; i < data.length; i++) {
    mapBarcode[data[i].barcode] = data[i];
    mapSku[data[i].sku] = data[i];
  }
}

List<Product> getById(String key) {
  List<Product> tmp = [];
  if (mapBarcode[key] != null)
    tmp.add(mapBarcode[key]);
  else if (mapSku[key] != null)
    tmp.add(mapSku[key]);
  else
    tmp = [];
  return tmp;
}
