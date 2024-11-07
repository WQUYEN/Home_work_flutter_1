import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bai_6 extends StatelessWidget {
  bai_6({super.key});

  final TodoController todoController = Get.put(TodoController());

  // Hàm để hiển thị dialog nhập chuỗi
  void _showInputDialog(BuildContext context, {ToDo? editingTodo}) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();
    // Nếu là chỉnh sửa, điền dữ liệu cũ vào các ô nhập liệu
    if (editingTodo != null) {
      titleController.text = editingTodo.title;
      subtitleController.text = editingTodo.subtitle;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(editingTodo == null ? 'Add' : 'Edit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Tiêu đề'),
              ),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(labelText: 'Mô tả'),
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
                // Lấy dữ liệu từ 2 TextField và thêm vào danh sách
                String title = titleController.text;
                String subtitle = subtitleController.text;
                if (title.isNotEmpty && subtitle.isNotEmpty) {
                  if (editingTodo == null) {
                    // Thêm mới nếu không có todo được chỉnh sửa
                    todoController.addTodo(ToDo(
                      id: todoController.todoList.length + 1, // ID mới
                      title:title,
                      subtitle: subtitle,
                    ));
                  } else {
                    // Cập nhật mục nếu đang chỉnh sửa
                    todoController.updateTodo(editingTodo.id, title, subtitle);
                  }
                }
                Navigator.pop(context); // Đóng dialog sau khi thêm
              },
              child: Text(editingTodo == null ? 'Add' : 'Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemBuilder: (context, position) {
              final item = todoController.todoList[position];
              return Dismissible(
                key: Key(item.id.toString()),
                onDismissed: (direction) {
                  todoController.removeTodoAt(position);
                },
                background: Container(
                  color: Colors.red, // Màu khi kéo sang trái
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child:
                        Icon(Icons.delete, color: Colors.white), // Icon delete
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: item.isChecked ? Colors.green[100] : Colors.white, // Màu nền thay đổi dựa trên trạng thái checkbox
                        borderRadius: BorderRadius.circular(8.0), // Bo tròn góc
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // Đổ bóng nhẹ
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const SizedBox(
                          width: 100,
                          height: 200,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage("assets/tham_ngan.jpg"),
                          ),
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(item.subtitle),
                        trailing: Checkbox(
                          value: item.isChecked,
                          onChanged: (bool? value) {
                            // Khi checkbox thay đổi, cập nhật trạng thái
                            if (value != null) {
                              todoController.toggleCheck(item.id);
                              // print(item.isChecked);
                            }
                          },
                        ),
                        onTap: () {
                          _showInputDialog(context, editingTodo: item);
                        },
                      ),
                    ),
                  ),
                ),              );
            },
            itemCount: todoController.todoList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(context); // Hiển thị dialog khi nhấn nút
        },
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ToDo {
  int id;
  String title;
  String subtitle;
  bool isChecked;

  ToDo({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isChecked = false,
  });
}


class TodoController extends GetxController {
  // Danh sách todo
  RxList<ToDo> todoList = [
    ToDo(id: 1, title: 'Work', subtitle: 'Deadline finish 5:00PM 06/11'),
    ToDo(id: 2, title: 'Work', subtitle: 'Deadline finish 5:00PM 06/11'),
    ToDo(id: 3, title: 'Study', subtitle: 'Study for exam'),
  ].obs;

  // Toggle checkbox
  void toggleCheck(int id) {
    var todo = todoList.firstWhere((todo) => todo.id == id);
    todo.isChecked = !todo.isChecked; // Đảo ngược trạng thái của isChecked
    todoList.refresh(); // Cập nhật giao diện khi thay đổi trạng thái
  }

  // Thêm mới Todo
  void addTodo(ToDo todo) {
    todoList.add(todo);
  }

  // Xóa Todo
  void removeTodoAt(int index) {
    todoList.removeAt(index);
  }

  // Cập nhật Todo
  void updateTodo(int id, String title, String subtitle) {
    var todo = todoList.firstWhere((todo) => todo.id == id);
    todo.title = title;
    todo.subtitle = subtitle;
    todoList.refresh(); // Cập nhật giao diện khi thay đổi trạng thái
  }
}
