import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_order_food/Screens/main_rider.dart';
import 'package:ta_order_food/Screens/main_shop.dart';
import 'package:ta_order_food/Screens/main_user.dart';
import 'package:ta_order_food/Screens/signin.dart';
import 'package:ta_order_food/Screens/signup.dart';
import 'package:ta_order_food/utility/my_style.dart';
import 'package:ta_order_food/utility/normai_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreference();
  }

  Future<void> checkPreference() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      String? chooseType = preferences.getString('ooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == 'Shop') {
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'Error User Type');
        }
      }
    } catch (e) {
      print('checkPreference error: $e');
    }
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 240, 243),
      appBar: AppBar(
        title: const Text("CounterPage"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              //ຟັງຊັນຄົ້ນຫາ
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
    child: ListView(
      children: <Widget>[showHeadDrawer(), signInMenu(), signUpMenu()],
    ),
  );

  ListTile signInMenu() {
    return ListTile(
      leading: const Icon(Icons.login),
      title: const Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route = MaterialPageRoute(
          builder: (value) => const SignIn(),
        );
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: const Icon(Icons.app_registration),
      title: const Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route = MaterialPageRoute(
          builder: (value) => const SingUp(),
        );
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Guest'),
      accountEmail: Text('Please Login'),
    );
  }
}
