import 'dart:typed_data';

import 'package:ai_asisst/screens/Homscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Imageshow extends StatelessWidget {
  final Uint8List image;

  const Imageshow({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              height: 340,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(20),
                child: Image.memory(image,
                fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Get.to(()=>const HomeScreen());
            }, child: const Text("Go To Menu ",style:  TextStyle(fontSize: 16),))
          ],
        ),
      ),
    );
  }
}
