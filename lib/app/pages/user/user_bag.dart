import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/widgets/empty_widget.dart';

class UserBag extends ConsumerWidget {
  const UserBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bagViewModel = ref.watch(bagProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(onPressed: () {
                    Navigator.of(context).pop();
                  }),
                  const Flexible(
                    child: Text(
                      "My Bag",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              bagViewModel.bagEmpty
                  ? const EmptyWidget(text: "Bag Empty")
                  : Flexible(
                      child: ListView.builder(
                        itemCount: bagViewModel.productCount,
                        itemBuilder: (context, index) {
                          final product = bagViewModel.productsBag[index];
                          return ListTile(
                            title: Text(product.name),
                            subtitle: Text("\$" + product.price.toString()),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                bagViewModel.removeProduct(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: \$" + bagViewModel.totalPrice.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final payment = ref.read(paymentProvider);
                        final user = ref.read(authStateChangesProvider);
                        final userBag = ref.watch(bagProvider);

                        final result = await payment.initPaymentSheet(
                          user.value!,
                          userBag.totalPrice,
                        );

                        if (!result.isError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Payment completed!')),
                          );
                          userBag.clearBag();
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(result.message),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
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
