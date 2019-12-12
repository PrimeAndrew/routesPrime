import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';
import 'package:zapp2/to_point.dart';

class FromPoint extends StatefulWidget {
  @override
  _FromPointState createState() => _FromPointState();
}

class _FromPointState extends State<FromPoint> {
  BitmapDescriptor customIcon;
  Set<Marker> markers;
  LatLng positionFrom;

  GoogleMapController mapController;

  String searchAddr;

  //Position userLocation = Position(latitude: -16.522815, longitude:-68.111820);
  Position userLocation;

  Geolocator geolocator = Geolocator();

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
    getLocation().then((position) {
      setState(() {
        userLocation = position;
      });
    });
  }

  void onMapCreated(controller) {
    Toast.show("Marque un origen", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      mapController = controller;
    });
  }

  searchandNavigate() {
    geolocator.placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 18.0)));
    });
  }

  Future<Position> getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Punto de partida"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
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
            // onMapCreated: (controller) {
            //   Toast.show("Marque un origen", context,
            //       duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            // },
            onMapCreated: onMapCreated,

            initialCameraPosition: CameraPosition(
              // target: LatLng(-16.5, -68.1500015),
              // target: LatLng(-16.522815, -68.111820),
              target: LatLng(userLocation.latitude, userLocation.longitude),
              zoom: 18,
            ),
          ),
          Positioned(
            top: 7.0,
            right: 65.0,
            left: 60.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Ingrese una dirección',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchandNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          if (positionFrom == null) {
            Toast.show("Marque un origen porfavor", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ToPoint(posFrom: positionFrom),
              ),
            );
          }
        },
      ),
    );
  }
}
