//-----------------------Bai 4----------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_homework_1/cart.dart';
import 'package:get/get.dart';

class bai_4 extends StatelessWidget {
  bai_4({super.key});

  final List<Product> products = [
    Product(id:1, name: "Quần bò",price:  200000, image: Image.asset('assets/quan_bo.jpeg'),review:  "Đẹp"),
    Product(id: 2,name:  "Áo phông",price:  200000,image:  Image.asset('assets/ao_phong.jpg'),review:  "Đẹp"),
    Product(id: 3,name:  "Tất", price: 200000,image:  Image.asset('assets/quan_bo.jpeg'),review:  "Đẹp"),
    Product(id: 4,name:  "Khăn quàng cổ", price: 200000,
       image:  Image.asset('assets/khan_quang_co.jpeg'),review:  "Đẹp"),
    Product(id: 5, name: "Găng tay", price: 200000,image:  Image.asset('assets/gang_tay.jpg'),review:  "Đẹp"),
    Product(id: 6, name: "Vòng cổ",price:  200000,image:  Image.asset('assets/vong_co.jpg'),review:  "Đẹp"),
  ];
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Chiều cao tùy chỉnh
          child: AppBar(
            title: const Text(
              "Xốp Bi",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepOrange,
            actions: [
              Obx(() {
                return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    // Thêm khoảng cách
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(
                                () => const CartScreen()); // Đảm bảo bạn gọi đúng tên class
                          },
                          icon: const Icon(Icons.shopping_cart_sharp,color: Colors.white,),
                        ),
                        if (cartController.itemCount >
                            0) // Kiểm tra số lượng sản phẩm
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${cartController.itemCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ));
              })
            ],
          ),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Số cột
                crossAxisSpacing: 8.0, //Khoảng cách giữa các cột
                mainAxisSpacing: 8.0, //Khoảng cách giữa các hàng
                childAspectRatio: 0.55 //Tỷ lệ chiều cao của mỗi item
                ),
            itemCount: products.length,
            itemBuilder: (context, position) {
              final item = products[position];
              return Card(
                elevation: 4.0, //Đổ bóng tạo chiều sâu
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, //Că  giữa
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 200, // Đặt chiều rộng
                          height: 250, // Đặt chiều cao
                          child: item.image,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(item.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('${item.price} VND',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.green)),
                      Text(item.review,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ElevatedButton(
                              onPressed: () {
                                print("Press buy now button");
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, // foreground
                                  backgroundColor: Colors.deepOrange,
                                  minimumSize: const Size(50, 30)),
                              child: const Text("Mua ngay"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  cartController.addProduct(item);
                                  print("${item.name} added to cart");
                                  Get.snackbar(
                                    "Thông báo", // Tiêu đề
                                    "Đã thêm ${item.name} vào giỏ hàng", // Nội dung
                                    snackPosition: SnackPosition.TOP, // Vị trí hiển thị
                                    backgroundColor: Colors.grey, // Màu nền
                                    colorText: Colors.white, // Màu chữ
                                    duration: const Duration(seconds: 2), // Thời gian hiển thị
                                    borderRadius: 8, // Bo tròn các góc
                                    margin: const EdgeInsets.all(16), // Khoảng cách bên ngoài
                                  );
                                },
                                child: const Icon(Icons.add_shopping_cart)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Product {
  int id;
  String name;
  int price;
  Image image;
  String review;
  bool isPay;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.review,
    this.isPay = false});
}

class CartController extends GetxController {
  var items = <Product>[].obs; // Danh sách sản phẩm trong giỏ hàng

  void addProduct(Product product) {
    items.add(product);
    refresh(); // Cập nhật trạng thái
  }
// Phương thức tính tổng giá tiền
//   int get totalPrice {
//     return items.fold(0, (sum, item) => sum + item.price);
//   }

  int get totalPrice {
    return items.where((item) => item.isPay).fold(0, (sum, item) => sum + item.price);
  }

  int get itemCount => items.length;// Trả về số sản phẩm trong giỏ hàng

  void removeProductAt(int index) {
    var productToRemove = items[index];
    items.removeWhere((item) => item.id == productToRemove.id);  }
  // Cập nhật product
  void updateProduct(int id,bool isPayment) {
    var product = items.firstWhere((product) => product.id == id);
    product.isPay = isPayment;
    items.refresh(); // Cập nhật giao diện khi thay đổi trạng thái
  }
}
