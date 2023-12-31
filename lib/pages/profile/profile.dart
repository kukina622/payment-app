import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:payment_app/pages/profile/profileListItem.dart';
import 'package:payment_app/widgets/myAppBar/myAppBar.dart';
import 'package:payment_app/widgets/myBottomNavigationBar/myBottomNavigationBar.dart';
import 'package:payment_app/widgets/myNavigationBar/myNavigationBar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 75),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyNavigationBar(title: "Profile"),
              const SizedBox(height: 10),
              ProfileListItem(title: "我的卡片", icon: Icons.credit_card),
              ProfileListItem(title: "載具", icon: MdiIcons.barcode),
              ProfileListItem(title: "電子發票", icon: Icons.request_quote),
              ProfileListItem(title: "交易記錄", icon: Icons.receipt_long),
              ProfileListItem(title: "優惠券", icon: Icons.confirmation_number),
              ProfileListItem(title: "回饋", icon: Icons.monetization_on),
            ],
          ),
        ),
      ),
      floatingActionButton: const MyBottomNavigationBar(initIndex: 3),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
