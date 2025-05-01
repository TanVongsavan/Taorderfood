import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_order_food/Screens/main_rider.dart';
import 'package:ta_order_food/Screens/main_shop.dart';
import 'package:ta_order_food/Screens/main_user.dart';
import 'package:ta_order_food/model/user_model.dart';
import 'package:ta_order_food/utility/my_style.dart';
import 'package:ta_order_food/utility/normai_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Field
  String? user;
  String? password;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Sign In')),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: <Color>[Colors.white, MyStyle().primaryColor],
                    center: Alignment(0, -0.3),
                    radius: 1.0,
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MyStyle().showLogo(),
                        MyStyle().mySizebox(),
                        MyStyle().showTitle('Tan Order Food'),
                        MyStyle().mySizebox(),
                        _loginForm(),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey, // Add Form key
      child: Column(
        children: [
          userForm(),
          MyStyle().mySizebox(),
          passwordForm(),
          MyStyle().mySizebox(),
          loginButton(),
        ],
      ),
    );
  }

  Widget loginButton() => Container(
    width: 250.0,
    child: ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Validate form
          setState(() {
            isLoading = true;
          });
          chakAuthen();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text('Login'),
    ),
  );
  Future<Null> chakAuthen() async {
    String url =
        'http://192.168.211.50/tan_order_food/getUserWhereUser.php?isAdd=true&User=$user';
    print('URL => $url');

    try {
      Response response = await Dio().get(url);
      print('Response statusCode => ${response.statusCode}');
      print('Response body => ${response.data}');
      ;

      if (response.data == null || response.data.toString() == 'null') {
        setState(() {
          isLoading = false;
        });
        normalDialog(context, 'ບໍ່ພົບຊື່ຜູ້ໃຊ້: $user');
        return;
      }

      var result = response.data;
      print('Response statusCode => ${response.statusCode}');
      print('Response body => ${response.data}');

      bool loginSuccess = false;

      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        print('DB User => ${userModel.user}');
        print('DB Password => ${userModel.password}');
        print('Input Password => $password');

        if (password != null && password == userModel.password) {
          loginSuccess = true;
          String chooseType = userModel.chooseType;
          print('Login success! Type => $chooseType');

          routeToService(
            (chooseType == 'User'
                    ? MainUser()
                    : chooseType == 'Shop'
                    ? MainShop()
                    : chooseType == 'Rider'
                    ? MainRider()
                    : null)
                as Widget,
            userModel,
          );
          break;
        }
      }

      if (!loginSuccess) {
        setState(() {
          isLoading = false;
        });
        normalDialog(context, 'ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ');
      }
    } catch (e) {
      print('Catch Error => $e');
      setState(() {
        isLoading = false;
      });
      normalDialog(context, 'ຂໍ້ຜິດພາດ: ${e.toString()}');
    }
  }

  Future<Null> routeToService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.setString('id', userModel.id);
    await preference.setString('ChooseType', userModel.chooseType);
    await preference.setString('Name', userModel.name);

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
    width: 250.0,
    child: TextFormField(
      onChanged: (value) => user = value.trim(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box, color: MyStyle().darkColor),
        labelStyle: TextStyle(color: MyStyle().darkColor),
        labelText: 'User :',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().primaryColor),
        ),
      ),
    ),
  );

  Widget passwordForm() => Container(
    width: 250.0,
    child: TextFormField(
      onChanged: (value) => password = value.trim(),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: MyStyle().darkColor),
        labelStyle: TextStyle(color: MyStyle().darkColor),
        labelText: 'Password :',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().primaryColor),
        ),
      ),
    ),
  );
}
