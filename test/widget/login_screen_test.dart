import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dummy_project/screens/login_screen.dart';

void main() {

  testWidgets("login button exists", (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.byKey(Key("loginBtn")), findsOneWidget);

  });

}