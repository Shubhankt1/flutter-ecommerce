import 'package:ecommerce/app/pages/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/app/pages/admin/admin_home.dart';
import 'package:ecommerce/app/pages/auth/sign_in_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      "pk_test_51L09g9SJ3MwccSb4xBbYTuU7ngqPlIDGvt4OwqkqBKgrlppY0ks2yJxTf6iFvRjTXaqNHidHSRsMmwOgvXrooi6i00UFL7L2YS";

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.amber,
          seedColor: Colors.amberAccent,
        ),
      ),
      home: AuthWidget(
        signedInBuilder: (context) => const UserHome(),
        adminSignedInBuilder: (context) => const AdminHome(),
        nonSignedInBuilder: (context) => const SignInPage(),
      ),
    );
  }
}
