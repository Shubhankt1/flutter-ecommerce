import 'package:ecommerce/app/pages/user/user_bag.dart';
import 'package:flutter/material.dart';

class UserTopBar extends StatelessWidget {
  final Widget leading;
  const UserTopBar({Key? key, required this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserBag(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag)),
      ],
      backgroundColor: ThemeData().scaffoldBackgroundColor,
      foregroundColor: Colors.black,
    );
  }
}
