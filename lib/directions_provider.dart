import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

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

    // for (int i = 0; i < way.length; i++) {
    //   print('hjhj');
    // //   print(way[i]);
    // }

    var result = await directionsApi.directionsWithLocation(
      origin,
      destination,
      travelMode: TravelMode.driving,
      //waypoints: way,
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
        // geodesic: true,
        // visible: true,
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

  getData(maps.LatLng point) async {
    var way = <Waypoint>[];
    var i = 0;
    var flag = 'no';

    await Firestore.instance
        .collection(db)
        .document('2')
        .collection('rutaida')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (f) {
          v1 = '${f.data['point'].latitude.toString()}';
          v2 = '${f.data['point'].longitude.toString()}';
          print(v1 + " - " + v2);
          print(point.latitude.toString() + ", " + point.longitude.toString());
          if (point.latitude.toString() == v1 &&
              point.longitude.toString() == v2 &&
              flag == 'no') {
            way.add(new Waypoint('via:$v1%2C$v2'));
            flag = 'si';
            print(flag);
            print(way[i]);
            i++;
          } else {
            if (flag == 'si') {
              way.add(new Waypoint('via:$v1%2C$v2'));
              print(flag);
              print(way[i]);
              i++;
            }
          }
          print(flag);
        },
      );
    });
    return way;
  }

  getPointNear(maps.LatLng point) async {
    var centerPointlat = point.latitude;
    var centerPointlng = point.longitude;
    var checkPointlat = 0.0;
    var checkPointlng = 0.0;
    var min = 100000000.0;
    maps.LatLng finalPoint;

    await Firestore.instance
        .collection(db)
        .document('2')
        .collection('rutaida')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (f) {
          // v1 = '${f.data['point'].latitude.toString()}';
          // v2 = '${f.data['point'].longitude.toString()}';
          checkPointlat = f.data['point'].latitude;
          checkPointlng = f.data['point'].longitude;
          //print("test:"+checkPointlat.toString()+" - "+checkPointlng.toString());
          var m = 50;
          var km = m / 1000;
          var ky = 40000 / 360;
          var kx = cos(pi * centerPointlat / 180.0) * ky;
          var dx = (centerPointlng - checkPointlng).abs() * kx;
          var dy = (centerPointlat - checkPointlat).abs() * ky;
          var dm = sqrt(dx * dx + dy * dy);
          if (dm <= km && dm <= min) {
            min = dm;
            finalPoint = maps.LatLng(checkPointlat, checkPointlng);
          }

          // way.add(new Waypoint('via:$v1%2C$v2'));
        },
      );
    });
    return finalPoint;
  }

  getFromPointNear2(maps.LatLng point, maps.LatLng pointCheck){
    var centerPointlat = point.latitude;
    var centerPointlng = point.longitude;
    var checkPointlat = pointCheck.latitude;
    var checkPointlng = pointCheck.longitude;
    var min = 100000000.0;
    maps.LatLng finalPoint;

    var m = 50;
    var km = m / 1000;
    var ky = 40000 / 360;
    var kx = cos(pi * centerPointlat / 180.0) * ky;
    var dx = (centerPointlng - checkPointlng).abs() * kx;
    var dy = (centerPointlat - checkPointlat).abs() * ky;
    var dm = sqrt(dx * dx + dy * dy);

    if (dm <= km && dm <= min) {
      min = dm;
      finalPoint = maps.LatLng(checkPointlat, checkPointlng);
    }

    // way.add(new Waypoint('via:$v1%2C$v2'));

    return finalPoint;
  }

  // getFromPointNear(maps.LatLng point) async {
  //   var centerPointlat = point.latitude;
  //   var centerPointlng = point.longitude;
  //   var checkPointlat = 0.0;
  //   var checkPointlng = 0.0;
  //   var max = -100.0;
  //   maps.LatLng finalPoint;

  //   await Firestore.instance
  //       .collection(db)
  //       .document('2')
  //       .collection('rutaida')
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach(
  //       (f) {
  //         // v1 = '${f.data['point'].latitude.toString()}';
  //         // v2 = '${f.data['point'].longitude.toString()}';
  //         checkPointlat = f.data['point'].latitude;
  //         checkPointlng = f.data['point'].longitude;
  //         var m = 50;
  //         var km = m / 1000;
  //         var ky = 40000 / 360;
  //         var kx = cos(pi * centerPointlat / 180.0) * ky;
  //         var dx = (centerPointlng - checkPointlng).abs() * kx;
  //         var dy = (centerPointlat - checkPointlat).abs() * ky;
  //         var dm = sqrt(dx * dx + dy * dy);
  //         if (dm >= km && dm >= max) {
  //           max = dm;
  //           finalPoint = maps.LatLng(checkPointlat, checkPointlng);
  //         }

  //         // way.add(new Waypoint('via:$v1%2C$v2'));
  //       },
  //     );
  //   });

  //   return finalPoint;
  // }
  // findLines(maps.LatLng from, maps.LatLng to,) async {
  //   var origin = Location(from.latitude, from.longitude);
  //   var destination = Location(to.latitude, to.longitude);
  //   print("hola2");

  //   var result = await directionsApi.directionsWithLocation(
  //     origin,
  //     destination,
  //     travelMode: TravelMode.driving,
  //     //waypoints: way,
  //   );

  //   if (result.isOkay) {
  //     var linea = result.routes[0];
  //     var leg = route.legs[0];

  //     List<maps.LatLng> points = [];

  //     leg.steps.forEach((step) {
  //       points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
  //       points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
  //     });

  //     notifyListeners();
  //   }

  //   print(result.toString());
  // }
}
