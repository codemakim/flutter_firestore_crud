import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/core/models/productModel.dart';
import 'package:firestore_crud/core/services/api.dart';
import 'package:firestore_crud/main.dart';
import 'package:flutter/cupertino.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Product> products;

  Future<List<Product>> fetchProducts() async {
    QuerySnapshot result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Product.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    DocumentSnapshot doc = await _api.getDocumentId(id);
    return Product.fromMap(doc.data, doc.documentID);
  }

  Future removeProduct(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateProduct(Product data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addProduct(Product data) async {
    await _api.addDocument(data.toJson());
    return ;
  }
}
