import 'package:flutter/material.dart';
import 'package:food_app/Checkbox_state.dart';
import 'package:food_app/randomizerR.dart';
import 'package:food_app/restaurant_list.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:dio/dio.dart';

class Filter extends StatefulWidget {
  Filter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  double _value = 20.0;
  double _currentSliderValue = 20;
  bool value = false;
  final notifications = [
    CheckBoxState(title: 'Chinese'),
    CheckBoxState(title: 'American'),
    CheckBoxState(title: 'Italian'),
    CheckBoxState(title: 'Mexican'),
    CheckBoxState(title: 'Indian'),
    CheckBoxState(title: 'Thai'),
  ];

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
                  'Filters',
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
                child: new Text(
                  "Price Range",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SfSlider(
                min: 0,
                max: 100,
                showLabels: true,
                showDividers: true,
                interval: 25,
                value: _value,
                labelPlacement: LabelPlacement.betweenTicks,
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  switch (actualValue) {
                    case 0:
                      return '\$';
                    case 25:
                      return '\$\$';
                    case 50:
                      return '\$\$\$';
                    case 75:
                      return '\$\$\$\$';
                  }
                  return actualValue.toString();
                },
                onChanged: (dynamic newValue) {
                  setState(
                        () {
                      _value = newValue;
                    },
                  );
                },
              ),
            ]),
            SizedBox(
              height: 65,
            ),
            Column(children: <Widget>[
              Container(
                child: new Text(
                  "Distance (Miles) ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 20,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ]),
            SizedBox(
              height: 70,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: new Text(
                    "Type of Food",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...notifications.map(buildSingleCheckbox).toList(),
              ],
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
                        "DONE !",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => restList()),
                        );
                      },
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }


  Widget buildSingleCheckbox(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.platform,
        value: checkbox.value,
        title: Text(
          checkbox.title,
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}