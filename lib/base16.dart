library base16;

import 'dart:convert';

const Base16Codec base16codec = Base16Codec();

String base16encode(final List<int> bytes) => base16codec.encode(bytes);

List<int> base16decode(final String encoded)=> base16codec.decode(encoded);

class Base16Codec extends Codec<List<int>, String>{
  const Base16Codec();

  final Converter<String, List<int>> decoder = const Base16Decoder();

  final Converter<List<int>, String> encoder = const Base16Encoder();
}

const int _radix = 16;
const int _charactersPerByte = 2;

class Base16Encoder extends Converter<List<int>, String>{
  const Base16Encoder();

  @override
  String convert(final List<int> input){
    final StringBuffer buffer = StringBuffer();
    for(final int byte in input)
      buffer.write(byte.toRadixString(_radix).padLeft(_charactersPerByte, "0"));
    return buffer.toString();
  }
}

class Base16Decoder extends Converter<String, List<int>>{
  const Base16Decoder();

  @override
  List<int> convert(final String input) => [
    for(int i=0; i<input.length; i+=_charactersPerByte)
      int.parse(input.substring(i, i+_charactersPerByte), radix: _radix),
  ];
}
