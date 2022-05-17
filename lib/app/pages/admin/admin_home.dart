import 'package:ecommerce/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/snackbars.dart';
import 'package:ecommerce/widgets/empty_widget.dart';
import 'package:ecommerce/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/app/providers.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: ref.read(dbProvider)!.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return const EmptyWidget(text: "No Products Found!");
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductListTile(
                  product: product,
                  onDelete: () async {
                    openIconSnackBar(
                      context,
                      "Product Deleted Succesfully!",
                      const Icon(Icons.check, color: Colors.white),
                    );
                    await ref.watch(dbProvider)!.deleteProduct(product.id!);
                  },
                  onPressed: () {},
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AdminAddProductPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
