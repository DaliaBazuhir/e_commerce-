import 'package:e_commerce_app/controllers/userCart.dart';
import 'package:e_commerce_app/controllers/userFavourites.dart';
import 'package:e_commerce_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/controllers/userCart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserFavourites()),
        ChangeNotifierProvider(create: (_) => cartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
