import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testinggg/main.dart';

void main() {
  testWidgets('Login gagal menampilkan SnackBar', (tester) async {
    await tester.pumpWidget(const MyApp());

    // input salah
    await tester.enterText(find.byKey(const Key('username')), 'wrong');
    await tester.enterText(find.byKey(const Key('password')), 'wrong');

    // klik login
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump(); // proses rebuild
    await tester.pump(const Duration(seconds: 1)); // biar snackbar muncul

    // cek snackbar
    expect(find.text("Username atau password salah"), findsOneWidget);
  });

  testWidgets('Login berhasil masuk ke Dashboard', (tester) async {
    await tester.pumpWidget(const MyApp());

    // input benar
    await tester.enterText(find.byKey(const Key('username')), 'admin');
    await tester.enterText(find.byKey(const Key('password')), '12345');

    // klik login
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle(); // tunggu animasi selesai

    // cek dashboard muncul
    expect(find.text("Dashboard"), findsOneWidget);
  });
}
