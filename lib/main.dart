import 'package:firestore_crud/core/viewmodels/CRUDModel.dart';
import 'package:firestore_crud/locator.dart';
import 'package:firestore_crud/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

GetIt locator = GetIt.instance;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => locator<CRUDModel>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
