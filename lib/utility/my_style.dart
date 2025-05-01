import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = const Color.fromARGB(255, 203, 19, 157);
  Color primaryColor = const Color.fromARGB(255, 236, 9, 28);
  TextStyle mainTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  );
  TextStyle mainh2Title = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 227, 205, 9),
  );

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: const Color.fromARGB(255, 234, 69, 9),
          fontWeight: FontWeight.bold,
        ),
      );

  Widget showTitleh2(String title) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: const Color.fromARGB(255, 228, 73, 12),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  MyStyle();
}
