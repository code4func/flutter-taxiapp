//import 'package:map_view/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class StepsRes {
  LatLng startLocation;
  LatLng endLocation;
  StepsRes({this.startLocation, this.endLocation});
//  Steps();
  factory StepsRes.fromJson(Map<String, dynamic> json) {
    return new StepsRes(
        startLocation: new LatLng(
            json["start_location"]["lat"], json["start_location"]["lng"]),
        endLocation: new LatLng(
            json["end_location"]["lat"], json["end_location"]["lng"]));
  }
}
