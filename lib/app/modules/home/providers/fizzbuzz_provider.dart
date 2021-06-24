import 'dart:math';

import 'package:get/get.dart';
import 'package:dartx/dartx.dart';

class FizzbuzzProvider extends GetxService {
  RxList<String> fizzbuzz = <String>[].obs;

  // Just for testing
  get message => 'fizzbuzz';

  List<String> generate(int start, int end) {
    List<String> response = <String>[];
    if(end >= start) {
      for (int i in start.rangeTo(end)) {
        var add = (i % 3 == 0 ? 'Fizz' : '') + (i % 5 == 0 ? 'Buzz' : '');
        response.add(add.isBlank ? '$i' : add);
      }
    }
    return response;
  }

  void generateRandom() {
    var random = Random();
    var x = random.nextInt(100);
    fizzbuzz.value = generate(x, x + random.nextInt(100));
  }
}
