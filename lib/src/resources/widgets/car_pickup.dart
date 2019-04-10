
import 'package:fl_uberapp/src/blocs/car_pickup_bloc.dart';
import 'package:flutter/material.dart';

class CarPickup extends StatefulWidget {

  final int distance;
  CarPickup(this.distance);

  @override
  _CarPickupState createState() => _CarPickupState();
}

class _CarPickupState extends State<CarPickup> {

  var carBloc = new CarPickupBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: carBloc.stream,
      builder: (context, snapshot){
        return Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 137),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: ListView.builder(itemBuilder: (context, index) {
                return FlatButton(
                  color: carBloc.isSelected(index) ? Color(0x3000ffff) : Colors.white,
                  onPressed: () {
                    carBloc.selectItem(index);
                  },
                  child: Container(
                    constraints: BoxConstraints.expand(width: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff323643),
                            borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                          child: Text(carBloc.carList.elementAt(index).name, style: TextStyle(color: Colors.white, fontSize: 10),),
                          padding: EdgeInsets.all(2),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff7f7f7),
                          ),
                          width: 64,
                          height: 64,
                          child: Center(
                            child: Image.asset(carBloc.carList.elementAt(index).assetsName),
                          ),
                        ),
                        Text("\$" + carBloc.carList.elementAt(index).pricePerKM.toString(), style: TextStyle(color: Color(0xff606470), fontSize: 12),)
                      ],
                    ),
                  ),
                );
              }, itemCount: carBloc.carList.length, scrollDirection: Axis.horizontal,),
            ),
            Positioned(
              bottom: 48, right: 0, left: 0, height: 50,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Total (" + _getDistanceInfo() + "): ",
                    style: TextStyle(fontSize: 18, color: Colors.black),),
                    Text("\$" + _getTotal().toString(), style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)
                  ],
                ),
            ),),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(onPressed: (){}, color: Color(0xff3277D8),
                    child: Text("Confirm Pickup", style: TextStyle(color: Colors.white, fontSize: 16),),),
              ),)
          ],
        );
      },
    );
  }

  String _getDistanceInfo() {
    double distanceInKM = widget.distance / 1000;
    return distanceInKM.toString() + " km";
  }

  double _getTotal() {
    double distanceInKM = widget.distance / 1000;
    return (distanceInKM * carBloc.getCurrentCar().pricePerKM);
  }
}
