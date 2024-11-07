import 'package:flutter/material.dart';

class bai_5 extends StatelessWidget {
  const bai_5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //       child: Text(
      //     "Weather App",
      //     style: TextStyle(color: Colors.white),
      //   )),
      //   backgroundColor: Colors.cyanAccent,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          // Tạo khoảng cách từ trên xuống 100 pixel
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Canh giữa theo chiều ngang
            mainAxisAlignment: MainAxisAlignment.start,
            // Bắt đầu từ trên cùng
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                // Bo tròn các góc của hình ảnh
                child: const SizedBox(
                  width: 250, // Chiều rộng của hình ảnh
                  height: 200, // Chiều cao của hình ảnh
                  child: Image(
                    image: AssetImage("assets/cloudy_weather.png"),
                    // Hình ảnh từ assets
                    fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 200, 0, 30),
                // Tạo khoảng cách trên 100 pixel, trái 20 pixel
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Canh trái cho các Text và Row
                  children: [
                    Text(
                      "29°C", // Hiển thị nhiệt độ
                      style: TextStyle(
                        fontSize: 50, // Kích thước chữ lớn
                        fontWeight: FontWeight.bold, // Chữ đậm
                      ),
                    ),
                    Text(
                      "Clear Sky", // Hiển thị mô tả thời tiết
                      style: TextStyle(
                        fontSize: 30, // Kích thước chữ nhỏ hơn
                        fontWeight: FontWeight.normal, // Chữ thường
                      ),
                    ),
                    Row(
                      // Hiển thị icon và text nằm ngang
                      children: [
                        Icon(
                          Icons.location_on, // Icon địa điểm
                          size: 30, // Kích thước của icon
                          color: Colors.blue, // Màu xanh cho icon
                        ),
                        SizedBox(width: 8), // Khoảng cách giữa icon và text
                        Text(
                          "Ha Noi", // Hiển thị tên địa điểm
                          style: TextStyle(
                            fontSize: 30, // Kích thước chữ
                            fontWeight: FontWeight.normal, // Chữ thường
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width, // Chiều rộng bằng chiều rộng của màn hình
                  decoration: const BoxDecoration(
                    color: Colors.cyanAccent, // Màu nền cho phần nửa dưới
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), // Bo tròn góc trên bên trái
                      topRight: Radius.circular(30), // Bo tròn góc trên bên phải
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Weather Today", // Thêm tiêu đề
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Các phần tử Column của bạn
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50, // Chiều rộng của hình ảnh
                                      height: 50, // Chiều cao của hình ảnh
                                      child: Image(
                                        image: AssetImage("assets/cloudy_weather.png"),
                                        fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: Text(
                                        "5:00 AM",
                                        style: TextStyle(fontSize: 15, color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "29°C",
                                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50, // Chiều rộng của hình ảnh
                                      height: 50, // Chiều cao của hình ảnh
                                      child: Image(
                                        image: AssetImage("assets/cloudy_weather.png"),
                                        fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: Text(
                                        "8:00 AM",
                                        style: TextStyle(fontSize: 15, color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "29°C",
                                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50, // Chiều rộng của hình ảnh
                                      height: 50, // Chiều cao của hình ảnh
                                      child: Image(
                                        image: AssetImage("assets/cloudy_weather.png"),
                                        fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: Text(
                                        "10:00 AM",
                                        style: TextStyle(fontSize: 15, color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "29°C",
                                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50, // Chiều rộng của hình ảnh
                                      height: 50, // Chiều cao của hình ảnh
                                      child: Image(
                                        image: AssetImage("assets/cloudy_weather.png"),
                                        fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: Text(
                                        "12:00 AM",
                                        style: TextStyle(fontSize: 15, color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "29°C",
                                      style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),

                              // Các Padding khác cho các thời điểm khác nhau
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
