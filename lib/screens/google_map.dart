import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google_map extends StatefulWidget {
  const Google_map({Key? key}) : super(key: key);

  @override
  _Google_mapState createState() => _Google_mapState();
}

// ignore: camel_case_types
class _Google_mapState extends State<Google_map> {
  List<Marker> myMarker = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(11.0778, 76.9897),
          zoom: 15,
        ),
        markers: Set.from(myMarker),
        onTap: _handleTap,
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      //myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }
}
