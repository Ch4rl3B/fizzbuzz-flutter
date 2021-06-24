import 'package:fizzbuzz/app/modules/home/providers/fizzbuzz_provider.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FizzbuzzProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
