import 'package:flutter_test/flutter_test.dart';
import 'package:app_receitas/main.dart';

void main() {
  testWidgets('Smoke test inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Receitas - Leandro Andrade dos Santos'), findsOneWidget);
  });
}
