import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zapp2/to_point.dart';

class FromPoint extends StatefulWidget {
  @override
  _FromPointState createState() => _FromPointState();
}

class _FromPointState extends State<FromPoint> {
  BitmapDescriptor customIcon;
  Set<Marker> markers;
  LatLng positionFrom;

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("From Point"),
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
            icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
            position: pos,
          );
          setState(() {
            markers.add(m);
          });
          positionFrom = pos;
        },
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: CameraPosition(
          target: LatLng(-16.5, -68.1500015),
          zoom: 18,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToPoint(
                posFrom: positionFrom
              ),
            ),
          );
        },
      ),
    );
  }
}
