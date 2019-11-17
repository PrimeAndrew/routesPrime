import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zapp2/route_screen.dart';

class ToPoint extends StatefulWidget {
  final LatLng posFrom;

  const ToPoint({this.posFrom});
  @override
  _ToPointState createState() => _ToPointState();
}

class _ToPointState extends State<ToPoint> {
  BitmapDescriptor customIcon;
  Set<Marker> markers;
  LatLng positionTo;

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Point"),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: markers,
        zoomGesturesEnabled: true,
        onTap: (pos) {
          print(pos);

          Marker m = Marker(
            markerId: MarkerId('1'),
            icon: customIcon,
            position: pos,
          );
          setState(() {
            markers.add(m);
          });
          positionTo = pos;
        },
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: CameraPosition(
          target: LatLng(-16.5, -68.1500015),
          zoom: 18,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Ok'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => RouteScreen(
              //   fromPoint: widget.posFrom,
              //   toPoint: position,
              // ),
              builder: (context) => RouteScreen(
                toPoint: positionTo,
                fromPoint: widget.posFrom,
              ),
            ),
          );
        },
      ),
    );
  }
}
