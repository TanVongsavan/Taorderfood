import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ta_order_food/utility/my_style.dart';

class AddInfoShop extends StatefulWidget {
  const AddInfoShop({super.key});

  @override
  State<AddInfoShop> createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  LatLng? latLng = LatLng(18.454941579390393, 102.50782727969444);

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void saveShopInfo() {
    String name = nameController.text.trim();
    String address = addressController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isEmpty || address.isEmpty || phone.isEmpty || latLng == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ')));
      return;
    }

    // TODO: บันทึกข้อมูลหรือส่งไปยังเซิร์ฟเวอร์
    print('Name: $name');
    print('Address: $address');
    print('Phone: $phone');
    print('Location: ${latLng!.latitude}, ${latLng!.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Information Shop')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            nameForm(),
            MyStyle().mySizebox(),
            addressForm(),
            MyStyle().mySizebox(),
            phoneForm(),
            MyStyle().mySizebox(),
            groupImage(),
            MyStyle().mySizebox(),
            showMap(),
            MyStyle().mySizebox(),
            saveButton(),
            MyStyle().mySizebox(),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(Icons.save),
        label: Text('ບັນທຶກຂໍ້ມູນ'),
        onPressed: saveShopInfo,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget showMap() {
    return Container(
      height: 300,
      child: FlutterMap(
        options: MapOptions(
          center: latLng!,
          zoom: 16.0,
          onTap: (tapPosition, newLatLng) {
            setState(() {
              latLng = newLatLng;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng!,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            // TODO: Implement image picking
          },
          icon: Icon(Icons.add_a_photo, size: 36.0),
        ),
        Container(
          width: 250.0,
          child: Image.asset('images/myimage.png', fit: BoxFit.cover),
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement alternate image picking
          },
          icon: Icon(Icons.add_photo_alternate, size: 36.0),
        ),
      ],
    );
  }

  Widget nameForm() => TextField(
    controller: nameController,
    decoration: InputDecoration(
      labelText: 'ຊື່ຮ້ານຄ້າ',
      prefixIcon: Icon(Icons.account_box),
      border: OutlineInputBorder(),
    ),
  );

  Widget addressForm() => TextField(
    controller: addressController,
    decoration: InputDecoration(
      labelText: 'ທີ່ຢູ່ຮ້ານຄ້າ',
      prefixIcon: Icon(Icons.house),
      border: OutlineInputBorder(),
    ),
  );

  Widget phoneForm() => TextField(
    controller: phoneController,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      labelText: 'ເບີຕິດຕໍ່ຮ້ານຄ້າ',
      prefixIcon: Icon(Icons.phone),
      border: OutlineInputBorder(),
    ),
  );
}
