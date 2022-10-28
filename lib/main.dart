import 'package:aumshopping/states/authen.dart';
import 'package:aumshopping/states/buyer_service.dart';
import 'package:aumshopping/states/create_account.dart';
import 'package:aumshopping/states/rider_service.dart';
import 'package:aumshopping/states/sellerservice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/sellerService': (BuildContext context) => SellerService(),
  '/riderService': (BuildContext context) => RiderService(),
};

String? initlalRoute;

Future<Null> main() async {
  // ดึงหน้าแอพ มาแสดงเป็นหน้าแรก

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  print('## type ===>> $type');
  if (type?.isEmpty ?? true) {
    initlalRoute = MyConstant.routeAuthen;
    runApp(MyApp());
  } else {
    switch (type) {
      case 'buyer':
        initlalRoute = MyConstant.routeBuyerService;
        runApp(MyApp());
        break;
      case 'seler':
        initlalRoute = MyConstant.routeSellerService;
        runApp(MyApp());
        break;
      case 'rider':
        initlalRoute = MyConstant.routeRiderService;
        runApp(MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ปิด คาดแดง
      debugShowCheckedModeBanner: false,
      // ชื่อ แอพ
      title: MyConstant.appName,
      // ดึงหน้าแอพมาแสดง
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
