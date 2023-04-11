import 'package:flutter/material.dart';
import '../search_model.dart';

class CardProduct extends StatelessWidget {
  final List<Product> showProducts;
  final dynamic index;

  CardProduct({required this.showProducts, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
            color: const Color(0xFFEEC6CA),
            border: Border.all(
                color: const Color.fromARGB(255, 122, 122, 122), width: 1.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  1.2,
                  1.2,
                ),
                blurRadius: 1.0,
              ), //BoxShadow//BoxShadow
            ],
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 19.0),
                      child: Text(
                        showProducts[index].title,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    )),
                    Expanded(
                      child: Text(
                        showProducts[index].aliasTitle,
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        border: Border(left: BorderSide(width: 1.0))),
                    child: Center(
                      child: Text(
                        'Barcode :\n${showProducts[index].barcode}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        border: Border(left: BorderSide(width: 1.0))),
                    child: Center(
                      child: Text(
                        'Sku :\n${showProducts[index].sku}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
