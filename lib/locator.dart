import 'package:firestore_crud/core/services/api.dart';
import 'package:firestore_crud/core/viewmodels/CRUDModel.dart';
import 'package:firestore_crud/main.dart';

void setupLocator() {
  locator.registerLazySingleton(() => Api('product'));
  locator.registerLazySingleton(() => CRUDModel());
}

