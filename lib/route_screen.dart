import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'directions_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_webservice/directions.dart' as webs;

class RouteScreen extends StatefulWidget {
  // final LatLng fromPoint = LatLng(-16.505641, -68.136560);
  // final LatLng toPoint = LatLng(-16.4838551, -68.1218507);

  final LatLng fromPoint;
  final LatLng toPoint;
  final List<LatLng> points;

  RouteScreen({this.fromPoint, this.toPoint, this.points});

  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  GoogleMapController _mapController;
  BitmapDescriptor customIcon;
  Set<Marker> markers;
  var way = <webs.Waypoint>[];

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route"),
      ),
      body: Consumer<DirectionsProvider>(
        builder: (BuildContext context, DirectionsProvider api, Widget child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.fromPoint,
              zoom: 19,
            ),
            markers: _createMarkers(),
            polylines: api.currentRoute,
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out_map),
        onPressed: _centerView,
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(
      markerId: MarkerId('fromPoint'),
      position: widget.fromPoint,
      infoWindow: InfoWindow(
        title: 'Origen',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
    ));
    tmp.add(Marker(
      markerId: MarkerId('toPoint'),
      position: widget.toPoint,
      infoWindow: InfoWindow(
        title: 'Destino',
      ),
    ));
    return tmp;
  }
  // codigo antiguo funcional
  // void _onMapCreated(GoogleMapController controller) async{
  //   LatLng fromPointNear;
  //   LatLng toPointNear;
  //   _mapController = controller;
  //   _centerView();
  //   var api = Provider.of<DirectionsProvider>(context);

  //   fromPointNear = await api.getPointNear(widget.fromPoint);
  //   toPointNear = await api.getPointNear(widget.toPoint);
  //   print('Near: $fromPointNear, $toPointNear');
  //   if (fromPointNear != null && toPointNear != null){
  //      way = await api.getData(fromPointNear);
  //   // for (int i = 0; i < way.length; i++) {
  //   //   print('hjhj');
  //   //   print(way[i]);
  //   // }
  //   api.findDirectons(fromPointNear, toPointNear, way)();
  //   }else{
  //     print("nulo");
  //   }

  // }
  void _onMapCreated(GoogleMapController controller) async {
    LatLng fromPointNear = widget.fromPoint;
    LatLng toPointNear = widget.toPoint;
    _mapController = controller;
    _centerView();
    var api = Provider.of<DirectionsProvider>(context);
    print(widget.points);
    api.findDirectons(fromPointNear, toPointNear, widget.points)();
  }

  _centerView() async {
    var api = Provider.of<DirectionsProvider>(context);

    await _mapController.getVisibleRegion();

    var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);

    api.currentRoute.first.points.forEach((point) {
      left = min(left, point.latitude);
      right = max(right, point.latitude);
      top = max(top, point.longitude);
      bottom = min(bottom, point.longitude);
    });

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );

    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }
}
