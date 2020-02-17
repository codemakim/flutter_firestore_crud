import 'package:firestore_crud/core/models/productModel.dart';
import 'package:firestore_crud/ui/views/productDetails.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;

  ProductCard({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetails(product: productDetails),
          ),
        );
        */
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetails(
              product: productDetails,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: <Widget>[
              Hero(
                tag: productDetails.id,
                child: Image.asset(
                  'assets/${productDetails.img}.jpg',
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      productDetails.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
