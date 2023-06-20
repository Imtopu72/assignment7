import 'package:flutter/material.dart';
import 'package:assignment7/productlist.dart';

void main () {

  runApp(Myapp());

}
class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: ProductListPage(),
    );
  }
}