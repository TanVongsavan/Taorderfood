import 'package:flutter/material.dart';
import 'package:ta_order_food/Screens/add_info_shop.dart';
import 'package:ta_order_food/utility/my_style.dart';

class InfomationShop extends StatefulWidget {
  const InfomationShop({super.key});

  @override
  State<InfomationShop> createState() => _InfomationShopState();
}

class _InfomationShopState extends State<InfomationShop> {
  void routeToAddInfo() {
    print('routeToAddInfo Work');
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyStyle().titleCenter(context, 'ຍັງບໍ່ມີຂໍ້ມູນກະລຸນາເພີ່ມ ຂໍ້ມູນ '),
        addAnEdirButton(),
      ],
    );
  }

  Row addAnEdirButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {
                  routeToAddInfo();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
