import 'package:flutter/material.dart';
import 'package:food_app/restaurant_model.dart';
import 'dart:math';

import 'package:rflutter_alert/rflutter_alert.dart';

class restList extends StatefulWidget {
  const restList({
    Key? key,
  }) : super(key: key);

  @override
  _restListState createState() => _restListState();
}

class _restListState extends State<restList> {
  List<String> names = ["Jinza Teriyaki", "Taco Gourmet Simply Fresh", "Panda Express", "Qdoba"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant near Cal Poly Pomona')),
      backgroundColor: Colors.indigo[100],
      body: ListView.builder(
          itemCount: Restaurant.restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: Restaurant.restaurants[index]);
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var random = Random();
          // createAlertDialog(context);
          await Alert(
              context: context,
              title: names[random.nextInt(names.length)],
              buttons: [
                DialogButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]).show();
        },
        child: Text('random'),
        backgroundColor: Colors.white
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(restaurant.name, style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 25),
        // Text('${restaurant.tags}')
      ],
    );
  }
}
