library base16;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

const Base16Codec base16codec = Base16Codec();

String base16encode(final Uint8List bytes) => base16codec.encode(bytes);

Uint8List base16decode(final String encoded)=> base16codec.decode(encoded);

class Base16Codec extends Codec<Uint8List, String>{
  const Base16Codec();

  final Converter<String, Uint8List> decoder = const Base16Decoder();

  final Converter<Uint8List, String> encoder = const Base16Encoder();
}

const int _radix = 16;
const int _charactersPerByte = 2;

class Base16Encoder extends Converter<Uint8List, String>{
  const Base16Encoder();

  @override
  String convert(final Uint8List input){
    final StringBuffer buffer = StringBuffer();
    for(final int byte in input)
      buffer.write(byte.toRadixString(_radix).padLeft(_charactersPerByte, "0"));
    return buffer.toString();
  }
}

class Base16Decoder extends Converter<String, Uint8List>{
  const Base16Decoder();

  @override
  Uint8List convert(final String input) {
    final BytesBuilder buffer = BytesBuilder(copy: false);
    for(int i=0; i<input.length; i+=_charactersPerByte)
      buffer.addByte(int.parse(input.substring(i, i+_charactersPerByte), radix: _radix));
    return buffer.takeBytes();
  }

}
