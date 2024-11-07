import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bai_7 extends StatelessWidget {
  bai_7({super.key});

  final ContactController contactController = Get.put(ContactController());

  // Hàm để hiển thị dialog nhập chuỗi
  void _showInputDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: const Text('Add new contact'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img_avatar.jpg'),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  String name = nameController.text;
                  String phoneNumber = phoneNumberController.text;
                  if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                    contactController.addContact(Contact(
                        contactController.conTactList.length + 1,
                        name,
                        phoneNumber));
                  }
                  Navigator.pop(context); // Đóng dialog sau khi thêm
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: Obx(
            () {
          // Nhóm các liên hệ theo chữ cái đầu tiên
          final groupedContacts = <String, List<Contact>>{};
          for (var contact in contactController.conTactList) {
            String firstLetter = contact.name[0].toUpperCase();
            if (groupedContacts[firstLetter] == null) {
              groupedContacts[firstLetter] = [];
            }
            groupedContacts[firstLetter]!.add(contact);
          }

          // Danh sách chữ cái để hiển thị
          final sortedKeys = groupedContacts.keys.toList()..sort();

          return ListView.builder(
            itemCount: sortedKeys.length,
            itemBuilder: (context, index) {
              String letter = sortedKeys[index];
              List<Contact> contacts = groupedContacts[letter]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  ...contacts.map((contact) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/img_avatar.jpg"),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            contact.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(contact.phoneNumber),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(context); // Hiển thị dialog khi nhấn nút
        },
        backgroundColor: Colors.grey,
        elevation: 16,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Contact {
  int id;
  String name;
  String phoneNumber;

  Contact(this.id, this.name, this.phoneNumber);
}

class ContactController extends GetxController {
  RxList<Contact> conTactList = [
    Contact(1, 'Mom', '01234567891'),
    Contact(2, 'Dad', '01234567891'),
    Contact(3, 'Contact 1', '01234567891'),
    Contact(4, 'Contact 2', '01234567891'),
    Contact(5, 'Contact 3', '01234567891'),
    Contact(6, 'Contact 4', '01234567891'),
    Contact(7, 'Contact 5', '01234567891'),
  ].obs;

  void addContact(Contact contact) {
    conTactList.add(contact);
    sortContacts(); // Sắp xếp lại danh sách sau khi thêm
  }

  void sortContacts() {
    conTactList.sort((a, b) => a.name.compareTo(b.name));
  }

  void removeContactAt(int index) {
    conTactList.removeAt(index);
  }

  void updateContact(int id, String name, String phoneNumber) {
    var contact = conTactList.firstWhere((contact) => contact.id == id);
    contact.name = name;
    contact.phoneNumber = phoneNumber;
    conTactList.refresh(); // Cập nhật giao diện khi thay đổi trạng thái
  }
}