import 'package:flutter/material.dart';
import 'package:flutter_homework_1/bai_1.dart';
import 'package:flutter_homework_1/bai_3.dart';
import 'package:flutter_homework_1/bai_4.dart';
import 'package:flutter_homework_1/bai_5.dart';
import 'package:flutter_homework_1/bai_6.dart';
import 'package:get/get.dart';
import 'bai_2.dart';
import 'bai_7.dart';


void main() {
  runApp(const GetMaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Work "),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Get.to(() => const bai_1());}, child: const Text("Bài 1")),
            ElevatedButton(onPressed: (){Get.to(() => const bai_2());}, child: const Text("Bài 2")),
            ElevatedButton(onPressed: (){Get.to(() => bai_3());}, child: const Text("Bài 3")),
            ElevatedButton(onPressed: (){Get.to( () => bai_4());}, child: const Text("Bài 4 + 9")),
            ElevatedButton(onPressed: (){Get.to(() => const bai_5());}, child: const Text("Bài 5")),
            ElevatedButton(onPressed: (){Get.to(() => bai_6());}, child: const Text("Bài 6 + 8")),
            ElevatedButton(onPressed: (){Get.to(() => bai_7());}, child: const Text("Bài 7")),
            // ElevatedButton(onPressed: (){Get.to(() => const Cart());}, child: const Text("Bài 9")),
          ],
        ),
      ),
    );
  }
}











