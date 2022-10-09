import 'package:aumshopping/states/authen.dart';
import 'package:aumshopping/states/buyer_service.dart';
import 'package:aumshopping/states/create_account.dart';
import 'package:aumshopping/states/rider_service.dart';
import 'package:aumshopping/states/sellerservice.dart';
import 'package:flutter/material.dart';
import 'utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/sellerService': (BuildContext context) => SellerService(),
  '/riderService': (BuildContext context) => RiderService(),
};

String? initlalRoute;

void main() {
  // ดึงหน้าแอพ มาแสดงเป็นหน้าแรก
  initlalRoute = MyConstant.routeAuthen;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ชื่อ แอพ
      title: MyConstant.appName,
      // ดึงหน้าแอพมาแสดง
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
