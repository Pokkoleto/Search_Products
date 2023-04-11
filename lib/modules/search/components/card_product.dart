import 'package:flutter/material.dart';
import '../search_model.dart';

class CardProduct extends StatelessWidget {
  List<Product> showProducts;
  dynamic index;

  CardProduct({required this.showProducts, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(102, 244, 106, 102),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    showProducts[index].title,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                Expanded(
                  child: Container(
                    child: Text(
                      showProducts[index].aliasTitle,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Barcode :\n${showProducts[index].barcode}',
                    style: const TextStyle(fontSize: 12.0),
                  ),
                )),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Sku :\n${showProducts[index].sku}',
                    style: const TextStyle(fontSize: 12.0),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
