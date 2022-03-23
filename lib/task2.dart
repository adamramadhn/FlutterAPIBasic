import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: GridView.count(
        //menampilkan grid baris sebanyak 4 item
        crossAxisCount: 4,
        children: [
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
          iconPerson('A'),
        ],
      ),
    );
  }

  //custom icon
  Widget iconPerson(String name) {
    return Center(
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            width: 50,
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(left: 17, top: 12),
            child: Text(
              name,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
