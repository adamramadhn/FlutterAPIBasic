import 'package:alert/alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  //menampung data list dari API
  List userData = [];

  //menjalankan sekali getUserData
  @override
  void initState() {
    super.initState();
    //menjalankan fungsi getUserData
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON ListView in FLutter'),
        ),
        //menggunakan listview agar dapat menggunakan scroll tampilan dan list data
        body: ListView(
          //mengubah userData dari List menjadi map
          children: userData.map((e) {
            return GestureDetector(
              onTap: () {
                print(e);
              },
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    //memanggil key dari map yang ada
                    child: dataList(e["name"], e["title"])),
              ),
            );
          }).toList(),
        ));
  }

  Widget dataList(
    String name,
    String nomer,
  ) {
    return ListTile(
      hoverColor: Colors.grey,
      title: Text(name),
      subtitle: Text(nomer),
      leading: iconUser(name[0]),
    );
  }

  Widget iconUser(String name) {
    return Stack(
      // fit: StackFit.passthrough,
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          width: 50,
          height: 50,
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ],
    );
  }

  //fungsi ini untuk menjalankan dio dependency untuk mengambil dan mengelola API
  //digunakan async await untuk menunggu data selesai dimuat
  void getUserData() async {
    //membuat variabel dari Dio()
    var dio = Dio();
    //melakukan safety agar aplikasi tidak crash saat gagal menjalankan dio.get/terjadi kesalahan
    try {
      var response =
          await dio.get('https://mock-database-f1298.web.app/api/v1/users');

      setState(() {
        userData = response.data["users"];
      });
    } catch (e) {
      Alert(message: 'Gagal memuat data..', shortDuration: false).show();
    }
  }
}
