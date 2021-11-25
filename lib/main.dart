// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// void main() => runApp(MyApp());
// final places =
// GoogleMapsPlaces(apiKey: "AIzaSyCy3U3uuhEC1jm5MB3XYDWzExshDHSzdS0");
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Foodie Map",
//       home: Scaffold(
//         // We'll change the AppBar title later
//           appBar: AppBar(title: Text("Restaurants Near Me")),
//           body: FoodieMap()),
//     );
//   }
// }
// class FoodieMap extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _FoodieMapState();
//   }
// }
// class _FoodieMapState extends State<FoodieMap> {
//   late Future<Position> _currentLocation;
//   Set<Marker> _markers = {};
//   @override
//   void initState() {
//     super.initState();
//     _currentLocation = Geolocator.getCurrentPosition();
//   }
//   Future<void> _retrieveNearbyRestaurants(LatLng _userLocation) async {
//     PlacesSearchResponse _response = await places.searchNearbyWithRadius(
//         Location( lng: _userLocation.longitude, lat: _userLocation.latitude), 10000,
//         type: "restaurant");
//     Set<Marker> _restaurantMarkers = _response.results
//         .map((result) => Marker(
//         markerId: MarkerId(result.name),
//         // Use an icon with different colors to differentiate between current location
//         // and the restaurants
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//         infoWindow: InfoWindow(
//             title: result.name,
//             snippet: "Ratings: " + (result.rating?.toString() ?? "Not Rated")),
//         position: LatLng(
//             result.geometry!.location.lat, result.geometry!.location.lng)))
//         .toSet();
//     setState(() {
//       _markers.addAll(_restaurantMarkers);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _currentLocation,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               // The user location returned from the snapshot
//               Position snapshotData = snapshot.data as Position;
//
//               LatLng _userLocation =
//               LatLng(snapshotData.latitude, snapshotData.longitude);
//               if (_markers.isEmpty) {
//                 _retrieveNearbyRestaurants(_userLocation);
//               }
//               return GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: _userLocation,
//                   zoom: 12,
//                 ),
//                 markers: _markers
//                   ..add(Marker(
//                       markerId: MarkerId("User Location"),
//                       infoWindow: InfoWindow(title: "User Location"),
//                       position: _userLocation)),
//               );
//             } else {
//               return Center(child: Text("Failed to get user location."));
//             }
//           }
//           // While the connection is not in the done state yet
//           return Center(child: CircularProgressIndicator());
//         });
//   }
// }



import 'package:flutter/material.dart';
import 'package:food_app/MainMenu.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'food me',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'food me '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _currentIndex = 0;
 final List<Widget> children = [
 ];
 void onTappedBar(int index)
 {
   setState(() {
     _currentIndex = index;

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
                  'food me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 100,

                ),
                ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.modulate),
               child: Image.asset('assets/logo.png'),

                ),
        ]
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'All your restaurant needs in one app',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 50,
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
                        child: new Text("Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 20 ),
                          textAlign: TextAlign.center,),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MainM(title: 'This is my main menu'),

                          ));
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
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
//
// void main() => runApp(MyApp());
//
// final places =
// GoogleMapsPlaces(apiKey: "YOUR-API-KEY");
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Foodie Map",
//       home: Scaffold(
//         // We'll change the AppBar title later
//           appBar: AppBar(title: Text("Retaurants Near Me")),
//           body: FoodieMap()),
//     );
//   }
// }
//
// class FoodieMap extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _FoodieMapState();
//   }
// }
//
// class _FoodieMapState extends State<FoodieMap> {
//   late Future<Position> _currentLocation;
//   Set<Marker> _markers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _currentLocation = Geolocator.getCurrentPosition();
//   }
//
//   Future<void> _retrieveNearbyRestaurants(LatLng _userLocation) async {
//     PlacesSearchResponse _response = await places.searchNearbyWithRadius(
//         Location(lat: _userLocation.latitude, lng: _userLocation.longitude), 100,
//         type: "restaurant");
//
//     Set<Marker> _restaurantMarkers = _response.results
//         .map((result) => Marker(
//         markerId: MarkerId(result.name),
//         // Use an icon with different colors to differentiate between current location
//         // and the restaurants
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
//         infoWindow: InfoWindow(
//             title: result.name,
//             snippet: "Ratings: " + (result.rating?.toString() ?? "Not Rated")),
//         position: LatLng(
//             result.geometry!.location.lat, result.geometry!.location.lng)))
//         .toSet();
//
//     setState(() {
//       _markers.addAll(_restaurantMarkers);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _currentLocation,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               // The user location returned from the snapshot
//               Position snapshotData = snapshot.data as Position;
//               LatLng _userLocation =
//               LatLng(snapshotData.latitude, snapshotData.longitude);
//
//               if (_markers.isEmpty) {
//                 _retrieveNearbyRestaurants(_userLocation);
//               }
//
//               return GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: _userLocation,
//                   zoom: 12,
//                 ),
//                 markers: _markers
//                   ..add(Marker(
//                       markerId: MarkerId("User Location"),
//                       infoWindow: InfoWindow(title: "User Location"),
//                       position: _userLocation)),
//               );
//             } else {
//               return Center(child: Text("Failed to get user location."));
//             }
//           }
//           // While the connection is not in the done state yet
//           return Center(child: CircularProgressIndicator());
//         });
//   }
// }
