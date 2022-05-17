import 'package:ecommerce/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/app/providers.dart';

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;
  final WidgetBuilder nonSignedInBuilder;

  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.adminSignedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => user != null
          ? signInHandler(context, ref, user)
          : nonSignedInBuilder(context),
      error: (err, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Something Went Wrong",
                style: TextStyle(fontSize: 22),
              ),
              Text(err.toString()),
            ],
          ),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  FutureBuilder<UserData?> signInHandler(
      BuildContext context, WidgetRef ref, User user) {
    final storage = ref.read(dbProvider)!;
    final userData = storage.getUser(user.uid);
    return FutureBuilder<UserData?>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            storage.addUser(UserData(
              email: user.email != null ? user.email! : "",
              uid: user.uid,
            ));
          }
          if (user.email == "admin@admin.com") {
            return adminSignedInBuilder(context);
          }
          return signedInBuilder(context);
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
