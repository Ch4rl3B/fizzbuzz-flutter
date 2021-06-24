import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text.rich(TextSpan(text: "", children: [
          TextSpan(text: "Fizz", style: TextStyle(color: controller.getColor('Fizz'))),
          TextSpan(text: "Buzz", style: TextStyle(color: controller.getColor('Buzz'))),
          TextSpan(text: " by "),
          TextSpan(text: "Ch4rl3"),
          TextSpan(text: "•", style: TextStyle(color: Theme.of(context).accentColor)),
          TextSpan(text: "B"),
        ])),
      ),
      body: Container(
        color: Colors.white,
        child: Obx(
          () => GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: controller.provider.fizzbuzz.length,
            itemBuilder: (BuildContext context, int index) {
              var text = controller.provider.fizzbuzz[index];
              return Card(
                color: controller.getColor(text),
                child: GridTile(
                  child: Center(child: Text(text, style: TextStyle(fontSize: 20.sp, color: Colors.white),)),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.provider.generateRandom(),
        child: LineIcon.random(),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
