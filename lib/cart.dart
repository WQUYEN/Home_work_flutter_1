import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bai_4.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(() {
        // Kiểm tra xem giỏ hàng có sản phẩm không
        if (cartController.items.isEmpty) {
          return const Center(
            child: Text("Giỏ hàng trống"),
          );
        }

        // Tạo một Map để lưu trữ số lượng sản phẩm
        Map<int, int> productCount = {};

        // Đếm số lượng sản phẩm
        for (var item in cartController.items) {
          if (productCount.containsKey(item.id)) {
            productCount[item.id] = productCount[item.id]! + 1;
          } else {
            productCount[item.id] = 1;
          }
        }

        // Lấy danh sách sản phẩm duy nhất từ giỏ hàng
        List<Product> uniqueProducts = productCount.keys.map((id) {
          return cartController.items.firstWhere((item) => item.id == id);
        }).toList();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: uniqueProducts.length,
                itemBuilder: (context, index) {
                  final product = uniqueProducts[index];
                  final quantity = productCount[product.id];

                  return Dismissible(
                    key: Key(product.id.toString()),
                    onDismissed: (direction) {
                      cartController.removeProductAt(index);
                      Get.snackbar(
                        "Thông báo", // Tiêu đề
                        "Đã xoá ${product.name} Khỏi giỏ hàng", // Nội dung
                        snackPosition: SnackPosition.TOP,
                        // Vị trí hiển thị
                        backgroundColor: Colors.grey,
                        // Màu nền
                        colorText: Colors.white,
                        // Màu chữ
                        duration: const Duration(seconds: 1),
                        // Thời gian hiển thị
                        borderRadius: 8,
                        // Bo tròn các góc
                        margin:
                            const EdgeInsets.all(16), // Khoảng cách bên ngoài
                      );
                    },
                    background: Container(
                      color: Colors.red, // Màu khi kéo sang trái
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.delete,
                            color: Colors.white), // Icon delete
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          product.name,
                          style: const TextStyle(fontSize: 25),
                        ),
                        subtitle: Text(
                          '${product.price} VND x${quantity}', // Hiển thị giá
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        leading: SizedBox(
                          width: 100,
                          height: 200,
                          child: product.image,
                        ),
                        trailing: Checkbox(
                          value: product.isPay, // Lấy giá trị từ isPay
                          onChanged: (bool? value) {
                            // Cập nhật trạng thái isPay
                            product.isPay = value ?? false;
                            // print('${product.name} isPay: ${product.isPay}');
                            cartController.updateProduct(product.id, product.isPay);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Hiển thị tổng giá tiền
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tổng tiền: ${cartController.totalPrice} VND',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
