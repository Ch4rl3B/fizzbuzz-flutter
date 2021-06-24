// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fizzbuzz/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fizzbuzz/main.dart' as mainApp;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    mainApp.main();
    await tester.pump();

    //When we run app HomeView may appear
    expect(find.byType(HomeView), findsOneWidget);

    //The first state of HomeView shows a description and a button


  });
}
