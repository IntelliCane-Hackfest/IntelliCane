import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsAPI extends StatefulWidget {
  const GoogleMapsAPI({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapsAPI> createState() => _GoogleMapsAPIState();
}

class _GoogleMapsAPIState extends State<GoogleMapsAPI> {
  final Completer<GoogleMapController> _controller = Completer();

  LatLng currentLocation = const LatLng(-7.797068, 110.370529);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 13.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("currentLocation"),
                position:
                    LatLng(currentLocation.latitude, currentLocation.longitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
              )
            },
          ),
        ),
      ],
    );
  }
}
