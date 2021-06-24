import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

// THE GOAT IS WATCHING...

void main() {
  runApp(
    ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: "FizzBuzz",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
