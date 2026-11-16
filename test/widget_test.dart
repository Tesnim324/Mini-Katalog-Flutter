import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow_mobile/main.dart';

void main() {
  testWidgets('Mini Katalog uygulamasi acilir', (tester) async {
    await tester.pumpWidget(const MiniCatalogApp());

    expect(find.text('Mini Katalog'), findsWidgets);
  });
}