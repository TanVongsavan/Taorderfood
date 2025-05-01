import 'package:flutter/material.dart';
import 'package:ta_order_food/Screens/home.dart';

void main() {
  //ແບບເຕັມ
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tan Order Food',
      home: Home(),
    );
  }
}

// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class MinScreen extends StatefulWidget {
//   const MinScreen({super.key});

//   @override
//   State<MinScreen> createState() => _MinScreenState();
// }

// class _MinScreenState extends State<MinScreen> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ໜ້າຫຼັກຂອງເເອັບ"),
//         backgroundColor: const Color.fromARGB(255, 58, 4, 146),
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 //ຟັງຊັນຄົ້ນຫາ
//               },
//               icon: Icon(Icons.search))
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration:
//                   BoxDecoration(color: const Color.fromARGB(255, 78, 19, 205)),
//               child: Text("ເມນູຫຼັກ",
//                   style: TextStyle(fontSize: 25, color: Colors.white)),
//             ),
//             ListTile(
//               title: Text("Counter Number"),
//               onTap: () {
//                 //ເວລາຄຣີກໃສ່ປຸ່ມເມນູນີ້ເເລ້ວໃຫ້ໄປເປີດໜ້າ ໃດໜື່ງຂຶ້ນມາ
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const Counternumber()));
//               },
//             ),
//             ListTile(
//               title: Text("Counter App"),
//               onTap: () {
//                 //ເວລາຄຣີກໃສ່ປຸ່ມເມນູນີ້ເເລ້ວໃຫ້ໄປເປີດໜ້າ ໃດໜື່ງຂຶ້ນມາ
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const counterPage()));
//               },
//             ),
//             ListTile(
//               title: Text("Count Down"),
//               onTap: () {
//                 //ເວລາຄຣີກໃສ່ປຸ່ມເມນູນີ້ເເລ້ວໃຫ້ໄປເປີດໜ້າ ໃດໜື່ງຂຶ້ນມາ
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const countdownpage()));
//               },
//             ),
//             ListTile(
//               title: Text("Love Calculator"),
//               onTap: () {
//                 //ເວລາຄຣີກໃສ່ປຸ່ມເມນູນີ້ເເລ້ວໃຫ້ໄປເປີດໜ້າ ໃດໜື່ງຂຶ້ນມາ
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const LoveCalculator1()));
//               },
//             ),
//             ListTile(
//               title: Text("Change Fonts"),
//               onTap: () {
//                 //ເວລາຄຣີກໃສ່ປຸ່ມເມນູນີ້ເເລ້ວໃຫ້ໄປເປີດໜ້າ ໃດໜື່ງຂຶ້ນມາ
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => MyFonts()));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: _selectedIndex == 0
//             ? Text("ໜ້າຫຼັກ")
//             : _selectedIndex == 1
//                 ? Text("ໜ້າການຕັ້ງຄ່າ")
//                 : Text("ໜ້າການເເຈ້ງເຕືອນ"),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "ໜ້າຫຼັກ"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "ການຕັ້ງຄ່າ"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications), label: "ການເເຈ້ງເຕືອນ"),
//         ],
//       ),
//       //ສ້າງປຸ່ມ floatingButton ປຸ່ມລອຍ
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //ເວລາກົດປຸ່ມລອຍໃຫ້ເກີດເຫດການໃດໜື່ງ
//         },
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 50, //ເງົາຂອງປຸ່ມ
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
