import 'package:ecommerce/services/firestore_service.dart';
import 'package:ecommerce/services/payment_service.dart';
import 'package:ecommerce/services/storage_service.dart';
import 'package:ecommerce/view_models/bag_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Provider] for [FirebaseAuth]
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

/// [StreamProvider] for [authStateChangesProvider]
final authStateChangesProvider = StreamProvider(
  (ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  },
);

/// [Provider] for [FirestoreService]
final dbProvider = Provider<FirestoreService?>(
  (ref) {
    final auth = ref.watch(authStateChangesProvider);

    String? uid = auth.asData?.value?.uid;
    if (uid != null) {
      return FirestoreService(uid: uid);
    }
    return null;
  },
);

/// [StreamProvider] for [authStateChangesProvider]
final storageProvider = Provider<StorageService?>(
  (ref) {
    final auth = ref.watch(authStateChangesProvider);
    String? uid = auth.asData?.value?.uid;
    if (uid != null) {
      return StorageService(uid: uid);
    }
    return null;
  },
);

/// [Provider] for [BagViewModel]
final bagProvider = ChangeNotifierProvider<BagViewModel>(
  (ref) => BagViewModel(),
);

/// [Provider] for [PaymentService]
final paymentProvider = Provider<PaymentService>((ref) {
  return PaymentService();
});
