import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart';

//import 'package:http/http.dart' as http;



class DirectionsProvider extends ChangeNotifier {
  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: 'AIzaSyDMOOwylpSGWL8CBIKlNLFnh_3dDOtDS0g');
  Set<maps.Polyline> _route = Set();


  Set<maps.Polyline> get currentRoute => _route;

  static double v1 = -16.506000;

  var way = <Waypoint> [
    new Waypoint('via:$v1%2C-68.139742'),
    new Waypoint('via:-16.506134%2C-68.141026'),
  ];

//-16.503167, -68.137649
  findDirectons(maps.LatLng from, maps.LatLng to) async {
    var origin = Location(from.latitude, from.longitude);
    var destination = Location(to.latitude, to.longitude);

    var result = await directionsApi.directionsWithLocation(
      origin,
      destination,
      travelMode: TravelMode.driving,
      waypoints: way,
    );
    // http.Response result = await http.get(
    //     'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&key=API_KEY');
  // final result =
  //         await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&key=API_KEY');

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
}
