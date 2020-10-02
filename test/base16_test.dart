import 'package:test/test.dart';

import 'package:base16/base16.dart';

const List<int> buf = [244, 11, 21, 63, 222, 56, 63, 111, 57, 64, 22, 56, 32, 55, 115, 178, 138, 230, 251];

main() => group("hex", (){
  test("hex", () => expect(base16encode(buf), "f40b153fde383f6f39401638203773b28ae6fb"));
  test("unhex", () => expect(base16decode("f40b153fde383f6f39401638203773b28ae6fb"), buf));
  test("match", () => expect(base16decode(base16encode(buf)), equals(buf)));
});