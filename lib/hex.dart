library hex;

import 'dart:typed_data';

//base16
String hex(final Uint8List uint8list){
  String buffer = "";
  uint8list.forEach((final int byte) => buffer += byte.toRadixString(16).padLeft(2, "0"));
  return buffer;
}
