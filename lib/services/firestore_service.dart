import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/models/user_data.dart';
import 'package:ecommerce/models/product_model.dart';

class FirestoreService {
  final String uid;
  FirestoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Add [Product] to [FirebaseFirestore]
  Future<void> addProduct(Product product) async {
    final docId = firestore.collection("products").doc().id;
    await firestore
        .collection("products")
        .doc(docId)
        .set(product.toMap(docId))
        .then(
          (_) => log("Product ${product.name} added!\n"),
        )
        .catchError(
          (onError) => log("Error"),
        );
  }

  /// Get all [Product]s from [FirebaseFirestore] DB
  Stream<List<Product>> getProducts() {
    return firestore.collection("products").snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            final d = doc.data();
            return Product.fromMap(d);
          }).toList(),
        );
  }

  /// Delete [Product] from [FirebaseFirestore]
  Future<void> deleteProduct(String id) async {
    return await firestore.collection("products").doc(id).delete();
  }

  /// Add [UserData] to [FirebaseFirestore]
  Future<void> addUser(UserData userData) async {
    await firestore.collection("users").doc(userData.uid).set(userData.toMap());
    log("User Added to cloud");
  }

  Future<UserData?> getUser(String uid) async {
    final doc = await firestore.collection("users").doc(uid).get();
    return doc.exists ? UserData.fromMap(doc.data()!) : null;
  }
}
