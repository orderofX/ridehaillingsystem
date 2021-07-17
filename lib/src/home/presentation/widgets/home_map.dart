import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMap extends StatefulWidget {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          widget._controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(6.6719625, -1.5886976), zoom: 16.4746, tilt: 59.4));
  }
}
