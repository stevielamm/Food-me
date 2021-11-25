import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:food_app/maps.dart';
import 'package:provider/provider.dart';


import 'Filters.dart';


class RestaurantPicker extends StatefulWidget {
  RestaurantPicker({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _RestaurantPickerState createState() => _RestaurantPickerState();

}

class _RestaurantPickerState extends State<RestaurantPicker> {

  createAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();

    return showDialog(context: context,builder: (context) {
          return AlertDialog(

            title: Text("Enter a Zip Code",textAlign: TextAlign.center,),
            content: TextField(

              controller: customController,
              keyboardType: TextInputType.number,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
            child: Text("Cancel",),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text("Search"),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Filter(title: 'THis is my Filters')),
              );
            },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  'Location',
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
                        child: new Text(
                          "Zip Code",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          createAlertDialog(context);

                          /* Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'THis is my 3rd page')),
                          );*/
                        })),
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
                        child: new Text("Use My Location",
                          style: TextStyle(color: Colors.white, fontSize: 20 ),
                          textAlign: TextAlign.center,),
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => mapPage()),
                        );
                      },)),
              ),
            ]),
            // SizedBox(
            //   height: 95,
            // ),
            // Column(children: <Widget>[
            //   Container(
            //     height: 50.0,
            //     width: 325.0,
            //     color: Colors.transparent,
            //     child: Container(
            //         decoration: BoxDecoration(
            //             color: Colors.grey[350],
            //             borderRadius: BorderRadius.all(Radius.circular(25.0))),
            //         child: new FlatButton(
            //             child: new Text("Enter Manually",
            //               style: TextStyle(color: Colors.white, fontSize: 20 ),
            //               textAlign: TextAlign.center,),
            //             onPressed: () {
            //               // Navigator.push(context,
            //               //   MaterialPageRoute(builder: (context) => MyHomePage(title: 'THis is my 3rd page')),
            //               // );
            //             }
            //         )),
            //   ),
            // ]),
          ],
        ),
      ),
    );
  }
}
