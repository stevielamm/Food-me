import 'package:flutter/material.dart';
import 'package:food_app/Restaurant.dart';
import 'package:food_app/Tip.dart';
import 'PayPicker.dart';


class MainM extends StatefulWidget {
  MainM({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainMState createState() => _MainMState();
}

class _MainMState extends State<MainM> {

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.indigo[100],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Main Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 65,
            ),
            Column(children: <Widget>[
              Container(
                height: 50.0,
                width: 325.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: new FlatButton(
                        child: new Text("Restaurant Picker",
                          style: TextStyle(color: Colors.white, fontSize: 20 ),
                          textAlign: TextAlign.center,),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RestaurantPicker(title: 'THis is my 3rd page')),
                          );
                        }
                    )),
              ),
            ]),
            SizedBox(
              height: 85,
            ),
            Column(children: <Widget>[
              Container(
                height: 50.0,
                width: 325.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: new FlatButton(
                        child: new Text("Tip Calculator",
                          style: TextStyle(color: Colors.white, fontSize: 20 ),
                          textAlign: TextAlign.center,),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TipCalculator(title: 'THis is my 3rd page')),
                          );
                        }
                    )),
              ),
            ]),
            SizedBox(
              height: 95,
            ),
            Column(children: <Widget>[
              Container(
                height: 50.0,
                width: 325.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: new FlatButton(
                        child: new Text("Payment Picker",
                          style: TextStyle(color: Colors.white, fontSize: 20 ),
                          textAlign: TextAlign.center,),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaymentPicker(title: 'This is my Payment Picker page')),
                          );
                        }
                    )),
              ),
            ]),

          ],

        ),
    ),
    );
    }
  }

