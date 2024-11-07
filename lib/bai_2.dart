//-----------Bai 2------------------------------------------
import 'package:flutter/material.dart';

const List<String> listColors = <String>['Red', 'Blue', 'Yellow', 'Brown'];
class bai_2 extends StatefulWidget {
  const bai_2({super.key});

  @override
  State<bai_2> createState() => _bai_2State();
}

class _bai_2State extends State<bai_2> {

  String dropdownValue = listColors.first;
  Color backgroundColor = Colors.white12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: backgroundColor,
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButton(
              value: dropdownValue,
              iconEnabledColor: Colors.white,
              elevation: 16,
              icon: const Icon(Icons.arrow_drop_down_circle),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  // Sử dụng switch-case để đặt màu nền
                  switch (value) {
                    case 'Red':
                      backgroundColor = Colors.red;
                      break;
                    case 'Blue':
                      backgroundColor = Colors.blue;
                      break;
                    case 'Yellow':
                      backgroundColor = Colors.yellow;
                      break;
                    case 'Brown':
                      backgroundColor = Colors.brown;
                      break;
                    default:
                      backgroundColor = Colors.white12;
                  }
                });
              },
              items: listColors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}