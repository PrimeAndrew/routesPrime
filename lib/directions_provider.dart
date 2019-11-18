import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DirectionsProvider extends ChangeNotifier {
  final databaseReference = Firestore.instance;
  final db = 'zapp2';
  static String v1;
  static String v2;

  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: 'AIzaSyDMOOwylpSGWL8CBIKlNLFnh_3dDOtDS0g');
  Set<maps.Polyline> _route = Set();
  Set<maps.Polyline> get currentRoute => _route;

  // var way = <Waypoint>[];
  // Firestore.instance
  //     .collection(db)
  //     .document('1')
  //     .collection('rutaida')
  //     .document('1')
  //     .get()
  //     .then(
  //   (DocumentSnapshot ds) async{
  //     v1 = ds['point'].latitude.toString();
  //     v2 = ds['point'].longitude.toString();
  //     way.add(new Waypoint('via:$v1%2C$v2'));
  //     print("lat: " + v1);
  //     print("lng: " + v2);
  //     print(way[0]);
  //   },
  // );

  findDirectons(maps.LatLng from, maps.LatLng to, List<Waypoint> way) async {
    var origin = Location(from.latitude, from.longitude);
    var destination = Location(to.latitude, to.longitude);
    print("hola");

    var result = await directionsApi.directionsWithLocation(
      origin,
      destination,
      travelMode: TravelMode.driving,
      waypoints: way,
    );

    Set<maps.Polyline> newRoute = Set();

    if (result.isOkay) {
      var route = result.routes[0];
      var leg = route.legs[0];

      List<maps.LatLng> points = [];

      leg.steps.forEach((step) {
        points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
        points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
      });

      var line = maps.Polyline(
        points: points,
        polylineId: maps.PolylineId('Ruta'),
        color: Colors.orange,
        width: 4,
      );
      newRoute.add(line);
      _route = newRoute;
      notifyListeners();
    }

    print(result.toString());
  }

  getData() async {
    var way = <Waypoint>[];

    await Firestore.instance
        .collection(db)
        .document('1')
        .collection('rutaida')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (f) {
          v1 = '${f.data['point'].latitude.toString()}';
          v2 = '${f.data['point'].longitude.toString()}';
          way.add(new Waypoint('via:$v1%2C$v2'));
        },
      );
    });

    // await Firestore.instance
    //     .collection(db)
    //     .document('1')
    //     .collection('rutaida')
    //     .document('1')
    //     .get()
    //     .then(
    //   (DocumentSnapshot ds) {
    //     v1 = ds['point'].latitude.toString();
    //     v2 = ds['point'].longitude.toString();
    //     way.add(new Waypoint('via:$v1%2C$v2'));
    //     // val = 'via:$v1%2C$v2';
    //     print('777777777777777777777777777777777');
    //     // print("lat: " + v1);
    //     // print("lng: " + v2);
    //     // print(way[0]);
    //   },
    //);
    return way;
  }
}
