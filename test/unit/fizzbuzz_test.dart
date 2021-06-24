// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:fizzbuzz/app/modules/home/providers/fizzbuzz_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dartx/dartx.dart';
import 'package:get/get.dart';

void main() {
  test('FizzBuzz provider init fine', () {
    //When we put provider on get context
    Get.put(FizzbuzzProvider());


    //Expect find correctly
    expect(Get.find<FizzbuzzProvider>().message, "fizzbuzz");
  });

  test('Generate FizzBuzz array from 0 to 5 have exactly 1 Fizz and 1 Buzz', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //When we call method from 0 to 10
    List<String> fizzbuzz = Get.find<FizzbuzzProvider>().generate(0, 5);

    //Expect array is not empty
    expect(fizzbuzz.isNotEmpty, true);

    //Expect fizzbuzz have exactly one 'Fizz'
    expect(fizzbuzz.where((element) => element == 'Fizz').length, 1);

    //Expect fizzbuzz have exactly one 'Buzz'
    expect(fizzbuzz.where((element) => element == 'Buzz').length, 1);

    //Then we close the instance
    Get.reset();
  });

  test('Generate FizzBuzz array from 11 to 20 have 2 Fizz and 1 Buzz and 1 FizzBuzz', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //When we call method from 11 to 20
    List<String> fizzbuzz = Get.find<FizzbuzzProvider>().generate(11, 20);

    //Expect array is not empty
    expect(fizzbuzz.isNotEmpty, true);

    //Expect fizzbuzz have exactly one 'Fizz'
    expect(fizzbuzz.where((element) => element == 'Fizz').length, 2);

    //Expect fizzbuzz have exactly one 'Buzz'
    expect(fizzbuzz.where((element) => element == 'Buzz').length, 1);

    //Expect fizzbuzz have exactly one 'FizzBuzz'
    expect(fizzbuzz.where((element) => element == 'FizzBuzz').length, 1);

    //Then we close the instance
    Get.reset();
  });

  test('Generate FizzBuzz array from 5 to 1 will return nothing', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //When we call method from 5 to 1
    List<String> fizzbuzz = Get.find<FizzbuzzProvider>().generate(5, 1);

    //Expect array is not empty
    expect(fizzbuzz.isEmpty, true);

    //Then we close the instance
    Get.reset();
  });

  test('Generate FizzBuzz array from 15 to 15 will return one FizzBuzz', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //When we call method from 15 to 15
    List<String> fizzbuzz = Get.find<FizzbuzzProvider>().generate(15, 15);

    //Expect array is not empty
    expect(fizzbuzz.isNotEmpty, true);

    //Expect fizzbuzz have one item
    expect(fizzbuzz.length, 1);

    //Expect fizzbuzz have 'FizzBuzz'
    expect(fizzbuzz[0], 'FizzBuzz');

    //Then we close the instance
    Get.reset();
  });

  test('Generate FizzBuzz array from random x to random y have (y - x + 1 elements) and contains Fizz or Buzz or FizzBuzz', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //Given 2 random numbers x and y
    Random random = Random();
    var x = random.nextInt(100);
    var y = x + random.nextInt(100);

    //When we call method from x to y
    List<String> fizzbuzz = Get.find<FizzbuzzProvider>().generate(x, y);

    //Expect array is not empty
    expect(fizzbuzz.isNotEmpty, true);

    //Expect fizzbuzz have y - x items
    expect(fizzbuzz.length, y - x + 1, reason: "+1 because x and y are inclusive in range");

    //Expect fizzbuzz have 'Fizz' 'Buzz' or 'FizzBuzz' on it
    expect(fizzbuzz.where((element) => element == 'Fizz' ||  element == 'Buzz' || element == 'FizzBuzz').length > 0, true);

    //Then we close the instance
    Get.reset();
  });

  test('Provider fizzbuzz is observable', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //Expect fizzbuzz is empty
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.isEmpty, true);

    //Given control variable
    int i = 0;

    //When we listen fizzbuzz
    Get.find<FizzbuzzProvider>().fizzbuzz.listen((_) => i++);

    //When we update it multiple times
    for(var i in 1.rangeTo(5)){
      Get.find<FizzbuzzProvider>().fizzbuzz.add('$i');
    }

    //Expect i = 5
    expect(i, 5);

    //Expect fizzbuzz value is ['1','2','3','4','5']
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.join(',') == ['1', '2', '3', '4', '5'].join(','), true);

    //Then we close the instance
    Get.reset();
  });

  test('Provider can generate random FizzBuzz array', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //When we call method to generate random
    Get.find<FizzbuzzProvider>().generateRandom();

    //Expect fizzbuzz is not empty
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.isEmpty, false);

    //Expect fizzbuzz have 'Fizz' 'Buzz' or 'FizzBuzz' on it
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.where((element) => element == 'Fizz' ||  element == 'Buzz' || element == 'FizzBuzz').length > 0, true);

    //Then we close the instance
    Get.reset();
  });

  test('Provider can generate multiple random FizzBuzz distinct', (){
    //Given provider initialization
    Get.put(FizzbuzzProvider());

    //Expect fizzbuzz is empty
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.isEmpty, true);

    //When we call method to generate random
    Get.find<FizzbuzzProvider>().generateRandom();

    //Expect fizzbuzz is not empty
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.isEmpty, false);

    //Expect fizzbuzz have 'Fizz' 'Buzz' or 'FizzBuzz' on it
    expect(Get.find<FizzbuzzProvider>().fizzbuzz.where((element) => element == 'Fizz' ||  element == 'Buzz' || element == 'FizzBuzz').length > 0, true);

    // Storing previous  fizzbuzz
    var previous = Get.find<FizzbuzzProvider>().fizzbuzz.join(',');


    //When generating a new one
    Get.find<FizzbuzzProvider>().generateRandom();

    //Expect generated is not equal to previous
    expect(previous != Get.find<FizzbuzzProvider>().fizzbuzz.join(','), true);

    //Then we close the instance
    Get.reset();
  });
}
