import 'package:flutter/material.dart';
import 'package:practice/controller/product_controller.dart';
import 'package:practice/view/product_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ProductProvider()..fetchProducts()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Product App',
      home: ProductListPage(),
    );
  }
}
