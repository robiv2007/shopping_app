import "package:flutter/material.dart";
import 'package:shopping_app/widgets/product_item.dart';
import "modal.dart";
import "../models/product.dart";

class ProductsOverviewScreenIos extends StatefulWidget {
  const ProductsOverviewScreenIos({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreenIos> createState() =>
      _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreenIos> {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // void addNew(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return GestureDetector(child: ModalSheet(addTx));
  //       });
  // }

  void addTx(String id, String title, String description, double price,
      String imageurl) {
    final newRecipe = Product(
        description: description,
        title: title,
        id: id,
        price: price,
        imageUrl: imageurl);

    setState(() {
      loadedProducts.add(newRecipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        leading: ElevatedButton(
          child: Icon(Icons.add),
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ModalSheet(addTx)),
            ),
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 2 : 3,
            childAspectRatio: isPortrait ? 3 / 2 : 2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => ProductItem(
            id: loadedProducts[i].id,
            title: loadedProducts[i].title,
            description: loadedProducts[i].description,
            imageUrl: loadedProducts[i].imageUrl),
        itemCount: loadedProducts.length,
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}
