import 'package:flutter/material.dart';
import 'package:ta_order_food/utility/my_style.dart';
import 'package:ta_order_food/utility/signou_process.dart';
import 'package:ta_order_food/widget/infomation_shop.dart';
import 'package:ta_order_food/widget/list_food_manu_shop.dart';
import 'package:ta_order_food/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  const MainShop({super.key});

  @override
  State<MainShop> createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Field
  Widget currentWidget = OrderListShop();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Shop')),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
    child: ListView(
      children: [
        showHead(),
        homeMenu(),
        foodMenu(),
        infomationMenu(),
        signOutMenu(),
      ],
    ),
  );

  ListTile homeMenu() => ListTile(
    leading: Icon(Icons.home),
    title: Text('ລາຍການອາຫານທີ່ ລູກຄ້າສັ່ງ'),
    subtitle: Text('ລາຍການອາຫານທີ່ຍັງບໍ່ໄດ້ ເຮັດສົ່ງລູກຄ້າ'),
    onTap: () {
      setState(() {
        currentWidget = OrderListShop();
      });
      Navigator.pop(context);
    },
  );

  ListTile foodMenu() => ListTile(
    leading: Icon(Icons.fastfood),
    title: Text('ລາຍການອາຫານ'),
    subtitle: Text('ລາຍການອາຫານ ຂອງຮ້ານ'),
    onTap: () {
      setState(() {
        currentWidget = ListFoodManuShop();
      });
      Navigator.pop(context);
    },
  );

  ListTile infomationMenu() => ListTile(
    leading: Icon(Icons.info),
    title: Text('ລາຍລະອຽດ ຂອງຮ້ານ'),
    subtitle: Text('ລາຍລະອຽດຂອງຮ້ານ ພ້ອມ Edit'),
    onTap: () {
      setState(() {
        currentWidget = InfomationShop();
      });
      Navigator.pop(context);
    },
  );

  ListTile signOutMenu() => ListTile(
    leading: Icon(Icons.exit_to_app),
    title: Text('Sign Out'),
    subtitle: Text(' Sign Out ແລະ ກັບໄປຢູ່ໜ້າແລກ'),
    onTap: () => signOutProcess(context),
  );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop1.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Name Login',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }
}
