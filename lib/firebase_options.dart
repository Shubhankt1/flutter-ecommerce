// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMrg1gCLtTvws8pbZoW0epTkaeSRumzuo',
    appId: '1:767852169922:web:86bc29d91a24cfa9a1c95b',
    messagingSenderId: '767852169922',
    projectId: 'ecommerce-shubhank',
    authDomain: 'ecommerce-shubhank.firebaseapp.com',
    storageBucket: 'ecommerce-shubhank.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVkmh_vgidX6jUV1nt_z7XIt2mOCiJBSE',
    appId: '1:767852169922:android:01a3491cf9e1aaa0a1c95b',
    messagingSenderId: '767852169922',
    projectId: 'ecommerce-shubhank',
    storageBucket: 'ecommerce-shubhank.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6WCHpFroD2Rtq6_BkBdLdxuLv2MXpnko',
    appId: '1:767852169922:ios:6cb73b062289feeca1c95b',
    messagingSenderId: '767852169922',
    projectId: 'ecommerce-shubhank',
    storageBucket: 'ecommerce-shubhank.appspot.com',
    iosClientId: '767852169922-t8o6bq1molcoi1ja1sbgq6et039itmib.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}