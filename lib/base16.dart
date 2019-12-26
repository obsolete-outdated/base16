library hex;

import 'dart:typed_data';

const int _radix = 16;

///Will only run on Dart 2.3 and higher
///<String> and <int> generic type annotations are redundant in this case when not annotated lists are used as arguments.

///base16
String base16encode(final Uint8List bytes) => (StringBuffer()..writeAll([for(final int byte in bytes) byte.toRadixString(_radix).padLeft(2, "0")])).toString();

///Assuming [hex.length] % 2 == 0
///doesn't run checks
Uint8List base16decode(final String hex)=> Uint8List.fromList([for(int i=0; i<hex.length ; i+=2) int.parse(hex.substring(i, i+2), radix: _radix)]);
