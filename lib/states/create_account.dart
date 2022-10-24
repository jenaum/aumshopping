import 'dart:io';

import 'package:aumshopping/utility/my_constant.dart';
import 'package:aumshopping/utility/my_dialog.dart';
import 'package:aumshopping/widgets/show_image.dart';
import 'package:aumshopping/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  final formKey = GlobalKey<FormState>();

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "กรุณากรอก ชื่อและนามสกุล ด้วย ครับ";
              } else {}
            },
            decoration: InputDecoration(
              labelText: 'กรุณากรอก ชื่อและนามสกุล ?',
              labelStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.person_outline,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAdress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "กรุณากรอก ที่อยู่ ด้วย ครับ";
              } else {}
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'กรุณากรอก ที่อยู่ ?',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Icon(
                  Icons.home_outlined,
                  color: MyConstant.dark,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return "กรุณากรอก เบอร์โทรศัทพ์ ด้วย ครับ";
              } else {}
            },
            decoration: InputDecoration(
              labelText: 'กรุณากรอก เบอร์โทรศัทพ์ ?',
              labelStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "กรุณากรอก ชื่อบัญชีผู้เข้าใช้ (User) ด้วย ครับ";
              } else {}
            },
            decoration: InputDecoration(
              labelText: 'ชื่อบัญชีผู้เข้าใช้ (User) ?',
              labelStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.person_add,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "กรุณากรอก รหัสผ่าน (Password) ด้วย ครับ";
              } else {}
            },
            decoration: InputDecoration(
              labelText: 'รหัสผ่าน (Password) ?',
              labelStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.lock,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          buildCreateNewAccount(),
        ],
        title: Text('สร้างบัญชีผู้ใช้'),
        backgroundColor: MyConstant.primry,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle('ข้อมูลทั่วไป'),
                buildName(size),
                buildAdress(size),
                buildPhone(size),
                buildUser(size),
                buildPassword(size),
                buildTitle('ชนิดของ User'),
                buildRadioBuyer(size),
                buildRadioSeller(size),
                buildRadioRider(size),
                buildTitle('รูปภาพ'),
                buildSubTitle(),
                buildAvatar(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (typeUser == null) {
            print('non Choose Type User');
            MyDialog().normalDialog(context, 'คุณยังไม่ได้เลือก ชนิดของ User !',
                'กรุณาเลือก Tap ชนิดของ User ที่ต้องการ ครับ');
          } else {
            print('Process Insrt to Database');
          }
        }
      },
      icon: Icon(Icons.cloud_upload),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: file == null
                ? ShowImage(path: MyConstant.avatar)
                : Image.file(file!),
          ),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
            color: MyConstant.dark,
          ),
        ),
      ],
    );
  }

  Container buildSubTitle() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 16, right: 20),
      child: ShowTitle(
        title:
            '   เป็นรูปภาพ ที่แสดงความเป็นตัวตนของ User (แต่ถ้าไม่ สะดวกแชร์ เราจะแสดงภาพ Default cmo)',
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  Row buildRadioBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "buyer",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ผู้ซื้อ (Buyer)',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "seler",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ผู้ขาย (Seller)',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: "rider",
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
              title: 'ผู้ส่งสินค้า (Rider)',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 20, bottom: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style(),
      ),
    );
  }
}
