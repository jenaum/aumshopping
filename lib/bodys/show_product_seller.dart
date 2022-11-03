import 'package:aumshopping/states/add_product.dart';
import 'package:aumshopping/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('แสดงสินค้า'),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddProduct),
        child: Text('เพิ่ม'),
      ),
    );
  }
}
