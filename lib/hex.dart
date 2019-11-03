library hex;

import 'dart:typed_data';

const int _radix = 16;

//base16
String hex(final Uint8List uint8list){
  String buffer = "";
  uint8list.forEach((final int byte) => buffer += byte.toRadixString(_radix).padLeft(2, "0"));
  return buffer;
}

Uint8List unhex(final String hex){
  final int _length = hex.length;
  if(_length%2 == 0) {
    final int octects = _length~/2;
    final Uint8List uint8list = Uint8List(octects);
    for(int i=0; i<octects; i++){
      final int pointer = i*2;
      //pointer+2 for dart scheme: substring[start, end}
      uint8list[i] = int.parse(hex.substring(pointer, pointer+2), radix: _radix);
    }
    return uint8list;
  } else {
    return throw("String is not base16 (hex) encoding: $hex");
  }
}
