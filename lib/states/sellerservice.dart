import 'package:aumshopping/bodys/shop_manage_seller.dart';
import 'package:aumshopping/bodys/show_order_seller.dart';
import 'package:aumshopping/bodys/show_product_seller.dart';
import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:flutter/material.dart';

import '../widgets/show_signout.dart';

class SellerService extends StatefulWidget {
  const SellerService({super.key});

  @override
  State<SellerService> createState() => _SellerServiceState();
}

class _SellerServiceState extends State<SellerService> {
  List<Widget> widgets = [ShowOrderSeller(), ShopManage(), ShowProduct()];
  int indexWidget = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้ขาย'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                menuShowOrder(),
                menuShopManage(),
                menuShowProduct(),
              ],
            ),
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  ListTile menuShowOrder() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_1_outlined,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'การสั่งซื้อ',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดการสั่งซื้อสินค้า',
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  ListTile menuShopManage() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_2,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'หน้าร้าน',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดของร้าน',
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  ListTile menuShowProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_3,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'สินค้า',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
        title: 'แสดงรายละเอียดสินค้าของร้าน',
        textStyle: MyConstant().h3Style(),
      ),
    );
  }
}
