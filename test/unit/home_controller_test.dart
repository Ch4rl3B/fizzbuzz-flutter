import 'package:fizzbuzz/app/modules/home/controllers/home_controller.dart';
import 'package:fizzbuzz/app/modules/home/providers/fizzbuzz_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

  test('Get color returns fine', () {
    //Given instance of HomeController
    Get.put(FizzbuzzProvider());
    HomeController controller = HomeController();

    //When we ask for any String
    var response = controller.getColor('any');

    //Then it return Colors.black
    expect(response, Colors.blueGrey);

    //When we ask for 'Fizz' String
    response = controller.getColor('Fizz');

    //Then it return Colors.black
    expect(response, Colors.red);

    //When we ask for 'Buzz' String
    response = controller.getColor('Buzz');

    //Then it return Colors.black
    expect(response, Colors.green);

    //When we ask for 'FizzBuzz' String
    response = controller.getColor('FizzBuzz');

    //Then it return Colors.black
    expect(response, Colors.amber);




  });
}