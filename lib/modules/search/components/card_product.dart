import 'package:flutter/material.dart';
import 'package:tcc_1/modules/search/search_model.dart';

class CardProduct extends StatelessWidget {
  List<Product> showProducts;
  dynamic index;

  CardProduct({required this.showProducts, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        children: [
          Expanded(child: Text(showProducts[index].title)),
          Expanded(
              flex: 2,
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
                    child: Text('Barcode :\n${showProducts[index].barcode}'),
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
                    child: Text('Sku :\n${showProducts[index].sku}'),
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
