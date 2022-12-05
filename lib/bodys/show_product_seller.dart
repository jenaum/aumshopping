import 'dart:convert';
import 'dart:html';

import 'package:aumshopping/models/product_model.dart';
import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/widgets/show_image.dart';
import 'package:aumshopping/widgets/show_progress.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    // if (productModels.length != 0) {
    //   productModels.clear();
    // } else {}

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

// สร้างตัวแปรดึงรูปมาใช้
  String createUrl(String string) {
    String result = string.substring(1, string.length - 1);
    List<String> strings = result.split(',');
    String url = '${MyConstant.domain}/aumshopping${strings[0]}';
    print('$url');
    return url;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShowTitle(
                    title: productModels[index].name,
                    textStyle: MyConstant().h2Style(),
                  ),
                  Container(
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxWidth * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: createUrl(productModels[index].images),
                        placeholder: (context, url) => ShowProgress(),
                        errorWidget: (context, url, error) =>
                            ShowImage(path: MyConstant.noimage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 4,
              height: constraints.maxWidth * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 36,
                          color: MyConstant.dark,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('## คุณคลิกที่ ลบ จาก index = $index');
                          confirmDialogDele(productModels[index]);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          size: 36,
                          color: MyConstant.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog ลบข้อมูล
  Future<Null> confirmDialogDele(ProductModel productModel) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: CachedNetworkImage(
            width: 100,
            fit: BoxFit.cover,
            imageUrl: createUrl(productModel.images),
            placeholder: (context, url) => ShowProgress(),
          ),
          title: ShowTitle(
            title: 'คุณต้องการลบ ข้อมูล ${productModel.name} หรือไม่ ?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: productModel.detail,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  print('## Confirm Delete at id ==> ${productModel.id}');
                  String apiDeleteProductWereId =
                      '${MyConstant.domain}/aumshopping/deleteProductWhereId.php?isAdd=true&id=${productModel.id}';
                  await Dio().get(apiDeleteProductWereId).then((value) {
                    Navigator.pop(context);
                    loadValueFromAPI();
                  });
                },
                child: ShowTitle(
                  title: 'ลบข้อมูล',
                  textStyle: MyConstant().h3RedStyle(),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: ShowTitle(
                  title: 'ยกเลิก',
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
