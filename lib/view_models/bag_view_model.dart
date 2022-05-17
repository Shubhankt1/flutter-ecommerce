import 'package:flutter/material.dart';

import 'package:ecommerce/models/product_model.dart';

class BagViewModel extends ChangeNotifier {
  final List<Product> productsBag;
  BagViewModel() : productsBag = [];

  // Getters
  /// Total [Product]s in the [productsBag]
  int get productCount => productsBag.length;

  /// Total price of the [productsBag]
  double get totalPrice {
    double totalPrice = 0;
    for (var element in productsBag) {
      totalPrice += element.price;
    }
    return totalPrice;
  }

  /// [productsBag] isEmpty?
  bool get bagEmpty => productsBag.isEmpty;

  /// Add [Product] to [productsBag]
  void addProduct(Product product) {
    productsBag.add(product);
    notifyListeners();
  }

  /// Delete [Product] from [productsBag]
  void removeProduct(Product product) {
    productsBag.remove(product);
    notifyListeners();
  }

  /// Clear [Product]s from [productsBag]
  void clearBag() {
    productsBag.clear();
    notifyListeners();
  }
}
