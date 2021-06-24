import 'package:fizzbuzz/app/modules/home/providers/fizzbuzz_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FizzbuzzProvider provider = Get.find<FizzbuzzProvider>();

  @override
  void onClose() {
    //Cleaning the provider
    provider.fizzbuzz.close();
    Get.delete<FizzbuzzProvider>();
  }

  getColor(String s) {
    switch (s) {
      case "Fizz":
        return Colors.red;
      case "Buzz":
        return Colors.green;
      case "FizzBuzz":
        return Colors.amber;
      default:
        return Colors.blueGrey;
    }
  }
}
