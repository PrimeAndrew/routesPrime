import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Minibus {
  final String linea;
  final String tiempo;
  final List<LatLng> puntos;
  //final List <String> rutaIda;
  //final List <String> rutaVuelta;

  Minibus({
    @required this.linea,
    @required this.tiempo,
    this.puntos,
    // @required this.rutaIda,
    //@required this.rutaVuelta,
  });
}
