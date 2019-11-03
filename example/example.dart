import 'dart:typed_data';
import 'package:base16/base16.dart';

final Uint8List _objectIDBytes = Uint8List.fromList(const [142, 71, 191, 93, 246, 100, 21, 15, 0, 205, 16, 37]);

void main() => print(hex(_objectIDBytes));