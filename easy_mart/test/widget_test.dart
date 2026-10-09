import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_mart/main.dart';

void main() {
  testWidgets('EasyMartApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: EasyMartApp(),
      ),
    );
    expect(find.byType(EasyMartApp), findsOneWidget);
  });
}
