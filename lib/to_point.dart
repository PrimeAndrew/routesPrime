import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';
import 'package:zapp2/listMini.dart';
//import 'package:zapp2/route_screen.dart';

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
  GoogleMapController mapController;

  String searchAddr;

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 18.0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Punto de destino"),
        backgroundColor: Colors.redAccent,
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
                markerId: MarkerId('2'),
                icon: customIcon,
                position: pos,
              );
              setState(() {
                markers.add(m);
              });
              positionTo = pos;
            },
            onMapCreated: (controller) {
              Marker m = Marker(
                markerId: MarkerId('1'),
                icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
                position: widget.posFrom,
              );
              setState(() {
                markers.add(m);
                mapController = controller;
              });
              Toast.show("Marque un destino", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.posFrom.latitude, widget.posFrom.longitude),
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
                  color: Colors.red,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Ingrese una direccion',
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
        backgroundColor: Colors.red,
        child: Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          if (positionTo == null) {
            Toast.show("Marque un destino porfavor", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => RouteScreen(
                //   fromPoint: widget.posFrom,
                //   toPoint: position,
                // ),
                // builder: (context) => RouteScreen(
                //   toPoint: positionTo,
                //   fromPoint: widget.posFrom,
                // ),
                builder: (context) => ListMini(
                  posTo: positionTo,
                  posFrom: widget.posFrom,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
