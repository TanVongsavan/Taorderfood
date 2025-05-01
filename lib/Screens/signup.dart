import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ta_order_food/utility/my_style.dart';
import 'package:ta_order_food/utility/normai_dialog.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  String? chooseType;
  String? name;
  String? user;
  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(30.0),
          children: <Widget>[
            myLogo(),
            MyStyle().mySizebox(),
            showAppName(),
            MyStyle().mySizebox(),
            nameForm(),
            MyStyle().mySizebox(),
            userForm(),
            MyStyle().mySizebox(),
            passwordForm(),
            MyStyle().mySizebox(),
            MyStyle().showTitleh2('ສະຖານະຂອງສະມາຊິກ :'),
            MyStyle().mySizebox(),
            userRadio(),
            shopRadio(),
            riderRadio(),
            MyStyle().mySizebox(),
            registerButton(),
            MyStyle().mySizebox(),
          ],
        ),
      ),
    );
  }

  Widget registerButton() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if (name == null || user == null || password == null) {
                normalDialog(context, 'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ');
              } else if (chooseType == null) {
                normalDialog(context, 'ກະລຸນາເລືອກສະຖານະຂອງຜູ້ສະໝັກ');
              } else {
                // repeatUser();
                registerThread();
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  );
  // Future<Null> repeatUser() async {
  //   String url =
  //       'http://localhost//tan_order_food/getUserWhereUser.php?isAdd=true&User=$user';

  //   try {
  //     Response response = await Dio().get(url);
  //     print('res=$response');

  //     if (response.toString() == 'null') {
  //       registerThread();
  //     } else {
  //       normalDialog(context, 'User $user ມີແລ້ວ ກະລຸນາລອງໃໝ່');
  //     }
  //   } catch (e) {
  //     print('Error in repeatUser(): $e');
  //   }
  // }

  Future<Null> registerThread() async {
    String url =
        'http://localhost//tan_order_food/addUser.php?isAdd=true&ChooseType=$chooseType&Name=$name&User=$user&Password=$password';

    try {
      Response response = await Dio().get(url);
      print('res=$response');

      if (response.toString() == 'true') {
        Navigator.pop(context);
        print('ການສະໝັກສໍາເລັດ'); // ກັບໄປຫາໜ້າ Login
      } else {
        normalDialog(context, 'ບໍ່ສາມາດສະໝັກໄດ້ ກະລຸນາລອງໃໝ່');
      }
    } catch (e) {
      print('Error in registerThread(): $e');
    }
  }

  Widget userRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 250.0,
        child: Row(
          children: [
            Radio<String>(
              value: 'User',
              groupValue: chooseType,
              onChanged: (value) {
                setState(() {
                  chooseType = value;
                });
              },
            ),
            Text('ຜູ້ສັ່ງອາຫານ', style: TextStyle(color: MyStyle().darkColor)),
          ],
        ),
      ),
    ],
  );

  Widget shopRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 250.0,
        child: Row(
          children: [
            Radio<String>(
              value: 'Shop',
              groupValue: chooseType,
              onChanged: (value) {
                setState(() {
                  chooseType = value;
                });
              },
            ),
            Text(
              'ເຈົ້າຂອງຮ້ານອາຫານ',
              style: TextStyle(color: MyStyle().darkColor),
            ),
          ],
        ),
      ),
    ],
  );

  Widget riderRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 250.0,
        child: Row(
          children: <Widget>[
            Radio<String>(
              value: 'Rider',
              groupValue: chooseType,
              onChanged: (value) {
                setState(() {
                  chooseType = value;
                });
              },
            ),
            Text('ຜູ້ສົ່ງອາຫານ', style: TextStyle(color: MyStyle().darkColor)),
          ],
        ),
      ),
    ],
  );

  Widget nameForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 250.0,
        child: TextFormField(
          onChanged: (value) => name = value.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'ກະລຸນາປ້ອນຊື່';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.face, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Name :',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    ],
  );

  Widget userForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 250.0,
        child: TextFormField(
          onChanged: (value) => user = value.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'ກະລຸນາປ້ອນຊື່ຜູ້ໃຊ້';
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    ],
  );

  Widget passwordForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        width: 250.0,
        child: TextFormField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ';
            }
            if (value.length < 6) {
              return 'ລະຫັດຜ່ານຄວນມີຢ່າງໜ້ອຍ 6 ຕົວອັກສອນ';
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    ],
  );

  Row showAppName() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[MyStyle().showTitle('Tan Order Food')],
  );

  Widget myLogo() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[MyStyle().showLogo()],
  );
}
