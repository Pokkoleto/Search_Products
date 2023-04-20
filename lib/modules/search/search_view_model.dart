import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'search_model.dart';

class SearchViewModel {
  Future<List<Product>> loadListOfProduct() async {
    String jsonString = await rootBundle.loadString('assets/SKU.json');
    final jsonData = json.decode(jsonString);
    List<Product> tmp =
        List<Product>.from(jsonData.map((json) => Product.fromJson(json)));
    return tmp;
  }

  Map<String, dynamic> mapBarcode = {};
  Map<String, String> mapSku = {};

  void createMap(List<Product> data) {
    for (int i = 0; i < data.length; i++) {
      mapBarcode[data[i].barcode] = data[i];
      mapSku[data[i].sku] = data[i].barcode;
    }
  }

  List<Product> getById(String key) {
    List<Product> tmp = [];
    if (mapBarcode[key] != null) {
      tmp.add(mapBarcode[key]);
    } else if (mapSku[key] != null) {
      tmp.add(mapBarcode[mapSku[key]]);
    } else {
      tmp = [];
    }
    return tmp;
  }

  List<Product> getByName(
      {required String key, required List<Product> allProduct}) {
    List<Product> results = [];
    results = allProduct
        .where((product) =>
            product.title.toLowerCase().contains(key.toLowerCase()) ||
            product.aliasTitle.toLowerCase().contains(key.toLowerCase()))
        .toList();
    return results;
  }
}
