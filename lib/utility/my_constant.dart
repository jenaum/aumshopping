import 'package:flutter/material.dart';

class MyConstant {
  // ชื่อ App
  static String appName = 'ซื้อสินค้า Delivery';
  static String domain = 'http://192.168.1.2';

  // Route หน้าแอพ ทั้งหมด
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSellerService = '/sellerService';
  static String routeRiderService = '/riderService';
  static String routeAddProduct = '/addProduct';

  // ดึงรูปมาแสดง
  static String loginapp1 = 'images/loginapp3.png';
  static String error1 = 'images/error1.png';
  static String avatar = 'images/avatar.png';
  static String images = 'images/images.png';
  static String noimage = 'images/noimage.png';

  // กำหนดสี Color
  static Color primry = Color(0xff1e88e5);
  static Color dark = Color(0xff005cb2);
  static Color light = Color(0xff6ab7ff);
  static Color red = Colors.red;
  // กำหนดสีทั้ง แอพ
  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(0, 92, 178, 0.1),
    100: Color.fromRGBO(0, 92, 178, 0.2),
    200: Color.fromRGBO(0, 92, 178, 0.3),
    300: Color.fromRGBO(0, 92, 178, 0.4),
    400: Color.fromRGBO(0, 92, 178, 0.5),
    500: Color.fromRGBO(0, 92, 178, 0.6),
    600: Color.fromRGBO(0, 92, 178, 0.7),
    700: Color.fromRGBO(0, 92, 178, 0.8),
    800: Color.fromRGBO(0, 92, 178, 0.9),
    900: Color.fromRGBO(0, 92, 178, 1.0),
  };

  // Style ตัวอักษร
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2WhiteStyle() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3RedStyle() => TextStyle(
        fontSize: 14,
        color: Colors.red,
        fontWeight: FontWeight.normal,
      );

// สร้าง Style ปุ่ม
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primry,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
