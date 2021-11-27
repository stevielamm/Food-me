
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Filters.dart';
import 'package:geolocator/geolocator.dart';


class mapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  late GoogleMapController _controller;
  late Position position;
  late Widget _child;
  static const apiKey = 'AIzaSyCy3U3uuhEC1jm5MB3XYDWzExshDHSzdS0';
  final radius = 100;
  final type = ['cost'];
  @override
  void initState() {
    // TODO: implement initState
    // _child=RippleIndicator("Getting Location");
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Filter(
                title: 'This is my filters page',
              )));
    });
  }
  // void didChangeDependencies() async {
  //   super.didChangeDependencies();
  //   print(await searchNearby('bagel'));
  // }
  // Future<List<String>> searchNearby(String keyword) async {
  //   var dio = Dio();
  //   // var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/output?json';
  //   var parameters = {
  //     'key': apiKey,
  //     'location': position,
  //     'radius': radius,
  //     'keyword': keyword,
  //   };
  //   var response = await dio.get(
  //       'https://maps.googleapis.com/maps/api/place/nearbysearch/output?json',
  //       queryParameters: parameters);
  //   return response.data['results'].map<String>((result) =>
  //       result['name'].toString()).toList();


  // }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: _child,
      // 1


    );
  }


  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 12.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("home"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: "User Location",
        ),
      ),
    ].toSet();
  }

}

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_webservice/places.dart';
//
// final places =
//     GoogleMapsPlaces(apiKey: "AIzaSyCy3U3uuhEC1jm5MB3XYDWzExshDHSzdS0");
//
// class mapPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // We'll change the AppBar title later
//         appBar: AppBar(title: Text("Googleplex's Location")),
//         body: FoodieMap());
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
//   late Position position;
//   late Widget _child;
//
//   // late Future<Position> _currentLocation;
//   Set<Marker> _markers = {};
//
//   @override
//   // void initState() {
//   //   super.initState();
//   //   _currentLocation = Geolocator.getCurrentPosition();
//   // }
//   void initState() {
//     // TODO: implement initState
//     // _child=RippleIndicator("Getting Location");
//     getCurrentLocation();
//     super.initState();
//   }
//
//   void getCurrentLocation() async {
//     Position res = await Geolocator.getCurrentPosition();
//     setState(() {
//       position = res;
//       // _child = mapWidget();
//     });
//   }
//
//   Future<void> _retrieveNearbyRestaurants(LatLng position) async {
//     PlacesSearchResponse _response = await places.searchNearbyWithRadius(
//         Location(lat: position.latitude, lng: position.longitude), 100,
//         type: "restaurant");
//
//     @override
//     Set<Marker> _restaurantMarkers = _response.results
//         .map((result) => Marker(
//             markerId: MarkerId(result.name),
//             // Use an icon with different colors to differentiate between current location
//             // and the restaurants
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueAzure),
//             position: LatLng(
//                 result.geometry!.location.lat, result.geometry!.location.lng)))
//         .toSet();
//
//     setState(() {
//       _markers.addAll(_restaurantMarkers);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 12,
//       ),
//       markers: _markers
//         ..add(
//           Marker(
//             markerId: MarkerId("User Location"),
//             infoWindow: InfoWindow(title: "User Location"),
//             position: LatLng(position.latitude, position.longitude),
//           ),
//         ),
//     );
//   }
// }
//
// return FutureBuilder(
//    future: _currentLocation,
//    builder: (context, snapshot) {
//      if (snapshot.connectionState == ConnectionState.done) {
//        if (snapshot.hasData) {
//          // The user location returned from the snapshot
//          Position snapshotData = snapshot.data;
//          LatLng _userLocation =
//              LatLng(snapshotData!.latitude, snapshotData.longitude);
//
// if (_markers.isEmpty) {
//   _retrieveNearbyRestaurants(position.latitude, position.longitude);
// }
//     }
//     else {
//       return Center(child: Text("Failed to get user location."));
//     }
//   }
//   // While the connection is not in the done state yet
//   return Center(child: CircularProgressIndicator());
// });
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart';
// class mapPage extends StatefulWidget {
//   @override
// _mapPageState createState() => _mapPageState();
//  }
// class _mapPageState extends State<mapPage> {
//   static const String _API_KEY = '{{AIzaSyCy3U3uuhEC1jm5MB3XYDWzExshDHSzdS0}}';
//   List<Marker> markers = <Marker>[];
//
//   Completer<GoogleMapController> _controller = Completer();
//
// // 2
//   final CameraPosition _myLocation =
//   CameraPosition(target: LatLng(34.000333332, -117.96832946),
//     bearing: 15.0, // 1
//     tilt: 75.0, // 2
//     zoom: 12,
//   );
//   // 1
//   void searchNearby(double latitude, double longitude) async {
//     setState(() {
//       markers.clear(); // 2
//     });
//     // 3
//     String url =
//         'baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=10000&keyword=${widget.keyword}';
//     print(url);
//     // 4
//     final response = await http.get(url);
//     // 5
//     // if (response.statusCode == 200) {
//     //   final data = json.decode(response.body);
//     //   _handleResponse(data);
//     //
//     // } else {
//     //   throw Exception('An error occurred getting places nearby');
//     // }
//     // setState(() {
//     //   searching = false; // 6
//     // });
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
// // 1
//       body: GoogleMap(
// // 2
//         initialCameraPosition: _myLocation,
// // 3
//         mapType: MapType.normal,
// // 4
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           searchNearby(34.000333332, -117.96832946); // 2
//         },
//         label: Text('Places Nearby'), // 3
//         icon: Icon(Icons.place), // 4
//       ),
//     );
//   }
//
// }



