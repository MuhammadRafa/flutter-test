import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testinggg/utils/validator.dart';

void main() {
  test('Valid email', () {
    expect(isValidEmail('test@gmail.com'), true);
  });

  test('Invalid email', () {
    expect(isValidEmail('wrong-email'), false);
  });
}
