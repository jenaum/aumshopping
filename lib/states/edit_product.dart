import 'package:aumshopping/models/product_model.dart';
import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class EditProduct extends StatefulWidget {
  final ProductModel productModel;
  const EditProduct({super.key, required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  ProductModel? productModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productModel = widget.productModel;
    // print('## name edit ==> ${productModel!.name}');
    nameController.text = productModel!.name;
    priceController.text = productModel!.price;
    detailController.text = productModel!.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไข ข้อมูลสินค้า'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('ข้อมูลสินค้า'),
              buildName(constraints),
              buildPrice(constraints),
              buildDetail(constraints),
            ],
          ),
        ),
      ),
    );
  }

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                labelText: 'ชื่อสินค้า',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
        ),
      ],
    );
  }

  Row buildPrice(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: priceController,
            decoration: InputDecoration(
                labelText: 'ราคาสินค้า',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
        ),
      ],
    );
  }

  Row buildDetail(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: detailController,
            decoration: InputDecoration(
                labelText: 'รายละเอียด สินค้า',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
        ),
      ],
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }
}
