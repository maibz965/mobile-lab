import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_2/main.dart';

// Fix 3: the old test used `Towa()` and a counter button that don't exist.
// This test checks what the profile page actually shows.
void main() {
  testWidgets('Profile page shows name, badge and skill card', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Bong Bong'), findsOneWidget);
    expect(find.text('Student'), findsOneWidget);
    expect(find.text('80%'), findsOneWidget);
    expect(find.text('Web Dev'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });
}
