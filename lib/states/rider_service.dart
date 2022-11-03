import 'package:flutter/material.dart';

import '../utility/my_constant.dart';
import '../widgets/show_signout.dart';

class RiderService extends StatefulWidget {
  const RiderService({super.key});

  @override
  State<RiderService> createState() => _RiderServiceState();
}

class _RiderServiceState extends State<RiderService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้ส่ง'),
      ),
      drawer: Drawer(
        child: ShowSignOut(),
      ),
    );
  }
}
