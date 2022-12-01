import 'package:ecommerce_app/provider/cartprovider.dart';
import 'package:ecommerce_app/provider/fetchdata.dart';
import 'package:ecommerce_app/provider/fetchdatabycategory.dart';
import 'package:ecommerce_app/provider/login.dart';
import 'package:ecommerce_app/provider/singleProduct.dart';
import 'package:ecommerce_app/provider/singledata.dart';
import 'package:ecommerce_app/provider/tokenprovider.dart';
import 'package:ecommerce_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FretchProductProvider()),
          ChangeNotifierProvider(create: (_) => SingleData()),
          ChangeNotifierProvider(create: (_) => SingleProductProvider()),
          ChangeNotifierProvider(create: (_) => FetchDataByCategoryProvider()),
          ChangeNotifierProvider(create: (_) => TokenProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: Brightness.light,
              primaryColor: Colors.green,
              backgroundColor: Colors.yellow),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.light,
          home: const SplashPage(),
        ));
  }
}
