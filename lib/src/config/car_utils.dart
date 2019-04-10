
import 'package:fl_uberapp/src/model/car_item.dart';

class CarUtils {
  static List<CarItem> cars;

  static List<CarItem> getCarList() {
    if(cars != null) {
      return cars;
    }

    cars = new List();
    cars.add(CarItem("SEDAN", "ic_pickup_sedan.png", 1.5));
    cars.add(CarItem("SUV", "ic_pickup_suv.png", 2));
    cars.add(CarItem("VAN", "ic_pickup_van.png", 2.5));
    cars.add(CarItem("AUDI", "ic_pickup_hatchback.png", 3));

    return cars;
  }
}