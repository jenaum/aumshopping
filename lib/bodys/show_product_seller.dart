import 'dart:convert';

import 'package:aumshopping/models/product_model.dart';
import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/widgets/show_progress.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  // ตัวแปร โหลดข้อมูล
  bool load = true;
  // ตัวแปร เช็คข้อมูลว่ามีหรือไม่
  bool? haveDate;
  // ตัวแปร เก็บข้อมูลสินค้า
  List<ProductModel> productModels = [];

  @override
  void initState() {
    super.initState();
    loadValueFromAPI();
  }

// ดึงข้อมูล API สินค้า
  Future<Null> loadValueFromAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    String apiGetProductWhereIdSeller =
        '${MyConstant.domain}/aumshopping/getProductWhereIdSeller.php?isAdd=true&idSeller=$id';
    await Dio().get(apiGetProductWhereIdSeller).then((value) {
      // print('value ==> $value');

      if (value.toString() == 'null') {
        // No Date
        setState(() {
          load = false;
          haveDate = false;
        });
      } else {
        // Have Date
        for (var iten in json.decode(value.data)) {
          ProductModel model = ProductModel.fromMap(iten);
          print('name product ==>> ${model.name} ');

          setState(() {
            load = false;
            haveDate = true;
            productModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? ShowProgress()
          : haveDate!
              ? LayoutBuilder(
                  builder: (context, Constraints) => buildListView(Constraints),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                        title: 'ไม่มีข้อมูลสินค้า',
                        textStyle: MyConstant().h1Style(),
                      ),
                      ShowTitle(
                        title: 'กรุณาเพิ่มข้อมูลสินค้า',
                        textStyle: MyConstant().h2Style(),
                      )
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeAddProduct),
        child: Text('เพิ่ม'),
      ),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (context, index) => Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 4,
              child: ShowTitle(
                title: productModels[index].name,
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowTitle(
                    title: 'ราคา : ${productModels[index].price} บาท',
                    textStyle: MyConstant().h2Style(),
                  ),
                  ShowTitle(
                    title: productModels[index].detail,
                    textStyle: MyConstant().h3Style(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
