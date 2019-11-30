import 'package:flutter/material.dart';

class Minibus
 {
  final String linea;
  final List <String> rutaIda;
  final List <String> rutaVuelta;

  Minibus({
    @required this.linea,
    @required this.rutaIda,
    @required this.rutaVuelta,
  });
}
