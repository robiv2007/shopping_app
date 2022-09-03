import "package:flutter/material.dart";

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? description;

  ProductItem({this.id, this.title, this.imageUrl, this.description});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GridTile(
      child: Image.network(
        imageUrl as String,
        fit: BoxFit.contain,
      ),
      footer: GridTileBar(
        leading: IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        backgroundColor: Colors.black54,
        title: isLandscape
            ? Text(title as String, textAlign: TextAlign.center)
            : Text(description as String, textAlign: TextAlign.center),
      ),
    );
  }
}
