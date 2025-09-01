import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testinggg/main.dart'; // ganti dengan nama project kamu

void main() {
  testWidgets('Tes alur login sederhana', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Masukkan username & password
    await tester.enterText(find.byType(TextField).first, 'admin');
    await tester.enterText(find.byType(TextField).last, '12345');

    // Klik tombol login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Cek apakah pindah ke Dashboard
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
