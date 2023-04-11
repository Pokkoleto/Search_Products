import 'package:flutter/material.dart';
import '../search_model.dart';

class CardProduct extends StatelessWidget {
  List<Product> showProducts;
  dynamic index;

  CardProduct({required this.showProducts, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(102, 244, 106, 102),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      showProducts[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: 1.0,
                          ),
                        ),
                      ),
                    child: Text(
                      showProducts[index].aliasTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Barcode :\n${showProducts[index].barcode}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Sku :\n${showProducts[index].sku}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
