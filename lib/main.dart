import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';


// THE GOAT IS WATCHING...

void main() {
  runApp(
    GetMaterialApp(
      title: "FizzBuzz",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
