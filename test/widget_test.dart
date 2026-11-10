import 'package:flutter_test/flutter_test.dart';

import 'package:lab_2/main.dart';

void main() {
  testWidgets('Profile page shows name and sections', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileApp());

    expect(find.text(profileName), findsOneWidget);
    expect(find.text('ABOUT ME'), findsOneWidget);
    expect(find.text('CONTACT'), findsOneWidget);
    expect(find.text('SKILLS'), findsOneWidget);
  });
}
