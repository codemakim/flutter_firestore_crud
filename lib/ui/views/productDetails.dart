import 'package:firestore_crud/core/models/productModel.dart';
import 'package:firestore_crud/core/viewmodels/CRUDModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await productProvider.removeProduct(product.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: product.id,
            child: Image.asset(
              'assets/${product.img}.jpg',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '${product.price} \$',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
