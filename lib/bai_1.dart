//---------------Bai 1-------------------
import 'package:flutter/material.dart';

class bai_1 extends StatelessWidget {
  const bai_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information App'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white ,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/img_avatar.jpg"),
                  ),
                ),
                Text("Name: Vu Van Quyen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Text("Age: 21"),
                Text("Address: Dan Phuong, Ha Noi"),
                Text("profession: Developer")
              ],
            ),
          ),
        ),
      ),
    );
  }
}