import 'package:firestore_crud/core/models/productModel.dart';
import 'package:firestore_crud/core/viewmodels/CRUDModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formkey = GlobalKey<FormState>();
  String productType = 'Bag';
  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    CRUDModel productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('App Product'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Product Title',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Please enter Product Title';
                  return null;
                },
                onSaved: (value) => title = value,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Price',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Please enter the Price';
                  return null;
                },
                onSaved: (value) => price = value,
              ),
              DropdownButton<String>(
                value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>['Bag', 'Computer', 'Dress', 'Phone', 'Shoes']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    await productProvider.addProduct(
                      Product(
                        name: title,
                        price: price,
                        img: productType.toLowerCase(),
                      ),
                    );
                  }
                },
                child: Text(
                  'add Product',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
