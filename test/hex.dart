import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:base16/base16.dart';

Uint8List uint8list = Uint8List.fromList([244, 11, 21, 63, 222, 56, 63, 111, 57, 64, 22, 56, 32, 55, 115, 178, 138, 230, 251]);
main() => test("hex", () => expect(unhex(hex(uint8list)), equals(uint8list)));