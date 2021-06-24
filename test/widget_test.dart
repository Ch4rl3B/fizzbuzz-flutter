// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fizzbuzz/app/modules/home/providers/fizzbuzz_provider.dart';
import 'package:fizzbuzz/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fizzbuzz/main.dart' as mainApp;
import 'package:get/get.dart';

void main() {
  testWidgets('Home view initial state', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    mainApp.main();
    await tester.pump();

    //When we run app HomeView may appear
    expect(find.byType(HomeView), findsOneWidget);

    //HomeView haves an observer
    expect(find.byType(Obx), findsOneWidget);

    //HomeView haves a ListView
    expect(find.byType(GridView), findsOneWidget);

    //HomeView haves FloatingActionButton
    expect(find.byType(FloatingActionButton), findsOneWidget);

    //The first state of HomeView shows an empty list
    expect(find.byType(GridTile), findsNothing);

    //When wi tap the FAB
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump(const Duration(seconds: 1));

    //Then a list will generate
    expect(find.byType(GridTile), findsWidgets);
  });
}
