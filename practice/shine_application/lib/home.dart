import 'package:flutter/material.dart';
import 'cardList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'images/pic$index.jpg',
                      fit: BoxFit.cover, // ให้รูปภาพเต็มพื้นที่
                    ),
                  ),
                  Container(
                    width: double.infinity, // ให้พื้นหลังเต็มความกว้าง
                    color: Colors.black, // สีพื้นหลังสีดำ
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0), // padding บนล่าง
                    child: Center(
                      child: TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),

                      // Text(
                      //   'TEXT ${index + 1}',
                      //   style: TextStyle(
                      //     color: Colors.white, // สีตัวอักษรสีขาว
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
