import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/widgets/show_image.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:flutter/material.dart';

class MyDialog {
// สร้างไดอาล๊อก หมุน
  Future<Null> showProgressDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        child: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
        onWillPop: () async {
          return false;
        },
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.error1),
          title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
          subtitle:
              ShowTitle(title: message, textStyle: MyConstant().h3Style()),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ปิด'),
          ),
        ],
      ),
    );
  }
}
