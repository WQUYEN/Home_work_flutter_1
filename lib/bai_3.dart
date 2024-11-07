//----------------------Bai 3-----------------------------------
import 'package:flutter/material.dart';

class MyFriend {
  int id;
  String name;
  int age;
  String phoneNumber;

  MyFriend(this.id, this.name, this.age, this.phoneNumber);
}

class bai_3 extends StatefulWidget {
  bai_3({super.key});

  final List<MyFriend> friendList = [
    MyFriend(1, "Nam 0", 21, "0997654461"),
    MyFriend(2, "Nam 1", 21, "0997654462"),
    MyFriend(3, "Nam 2", 21, "0997654463"),
    MyFriend(4, "Nam 3", 21, "0997654464"),
    MyFriend(5, "Nam 4", 21, "0997654465"),
    MyFriend(6, "Nam 5", 21, "0997654466"),
  ];

  @override
  State<bai_3> createState() => _bai_3State();
}

class _bai_3State extends State<bai_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friend List"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.separated(
          separatorBuilder: (context, position) {
            return const Divider(
              color: Colors.grey, // Màu của đường gạch
              thickness: 1.5, // Độ dày của gạch
              indent: 16.0, // Khoảng cách từ đầu gạch
              endIndent: 16.0, // Khoảng cách từ cuối gạch
            );
          },
          itemCount: widget.friendList.length,
          itemBuilder: (context, position) {
            final item = widget.friendList[position];
            return ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/img_avatar.jpg"),
              ),
              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Text("Contact: ${item.phoneNumber}"),
            );
          }),
    );
  }
}