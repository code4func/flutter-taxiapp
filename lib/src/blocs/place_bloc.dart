import 'dart:async';

import 'package:fl_uberapp/src/repository/place_service.dart';

class PlaceBloc {
  var _placeController = StreamController();
  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyword) {
    print("place bloc search: " + keyword);

    _placeController.sink.add("start");
    PlaceService.searchPlace(keyword).then((rs) {
      _placeController.sink.add(rs);
    }).catchError(() {
//      _placeController.sink.add("stop");
    });
  }

  void dispose() {
    _placeController.close();
  }
}
