import 'package:flutter/material.dart';

class MyConstant {
  // ชื่อ App
  static String appName = 'ทรัพยากรมนุษย์';

  // Route หน้าแอพ ทั้งหมด
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSellerService = '/sellerService';
  static String routeRiderService = '/riderService';

  // ดึงรูปมาแสดง
  static String loginapp1 = 'images/loginapp3.png';
  static String error1 = 'images/error1.png';
  static String avatar = 'images/avatar.png';

  // กำหนดสี Color
  static Color primry = Color(0xff1e88e5);
  static Color dark = Color(0xff005cb2);
  static Color light = Color(0xff6ab7ff);
  static Color red = Colors.red;

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
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
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
