import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_overview_ios.dart';
import 'package:shopping_app/screens/product_overview_screen.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          Platform.isAndroid ? ProductOverviewIOS() : ProductsOverviewScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Välkommna"),
      ),
      body: Center(
        child: Text("My Shop"),
      ),
    );
  }
}
