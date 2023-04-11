import 'dart:io';

import 'package:flutter/material.dart';
import 'search_view_model.dart';
import 'search_model.dart';
import 'package:tcc_1/modules/search/components/card_product.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

late List<Product> products;
late List<Product> showProducts;

String searchText = '';

void startUp() async {
  products = await loadListOfProduct();
  showProducts = products;
  createMap(products);
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();

    setState(() {
      startUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: loadListOfProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              products = snapshot.data;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        //** TextField **//
                        Expanded(
                          flex: 3,
                          child: TextField(
                            onChanged: (val) {
                              setState(() {
                                searchText = val;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Search Here',
                            ),
                          ),
                        ),
                        //** ID Button **//
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (searchText == '') {
                                  showProducts = products;
                                } else {
                                  showProducts = getById(searchText);
                                }
                              });
                            },
                            child: const Text('ID'),
                          ),
                        ),
                        //** Name Button **//
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Name'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //** List Productshow **//
                  Expanded(
                    child: ListView.builder(
                      itemCount: showProducts.length,
                      itemBuilder: (contex, index) {
                        return CardProduct(
                          showProducts: showProducts,
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
