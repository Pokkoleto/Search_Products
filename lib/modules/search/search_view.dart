import 'package:flutter/material.dart';
import 'search_view_model.dart';
import 'search_model.dart';
import './components/card_product.dart';

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
      backgroundColor: const Color.fromRGBO(188, 244, 222, 1),
      body: SafeArea(
        child: listOfProducts(),
      ),
    );
  }

  FutureBuilder<List<Product>> listOfProducts() {
    return FutureBuilder(
      future: loadListOfProduct(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    textField(),
                    const SizedBox(
                      width: 3.5,
                    ),
                    idButton(),
                    const SizedBox(
                      width: 3.5,
                    ),
                    nameButton(),
                  ],
                ),
              ),
              listShowProducts(),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Expanded listShowProducts() {
    return Expanded(
      child: ListView.builder(
        itemCount: showProducts.length,
        itemBuilder: (contex, index) {
          return CardProduct(
            showProducts: showProducts,
            index: index,
          );
        },
      ),
    );
  }

  Expanded nameButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 230, 129, 146),
            fixedSize: const Size(5.0, 10.0)),
        onPressed: () {
          setState(() {
            if (searchText == '') {
              showProducts = products;
            } else {
              final stopwatch = Stopwatch();
              stopwatch.start();
              showProducts = getByName(key: searchText, allProduct: products);
              stopwatch.stop();
              print('${stopwatch.elapsedMicroseconds} mico sec');
            }
          });
        },
        child: const Text(
          'Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Expanded idButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 238, 100, 143),
            fixedSize: const Size(5.0, 10.0)),
        onPressed: () {
          setState(() {
            if (searchText == '') {
              showProducts = products;
            } else {
              final stopwatch = Stopwatch();
              stopwatch.start();
              showProducts = getById(searchText);
              stopwatch.stop();
              print('${stopwatch.elapsedMicroseconds * 0.001} ms');
            }
          });
        },
        child: const Text(
          'ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Expanded textField() {
    return Expanded(
      flex: 3,
      child: SizedBox(
        height: 35.0,
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
    );
  }
}
