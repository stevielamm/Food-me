import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/maps.dart';

class Restaurant extends mapPage {
  final int id;
  final String name;
  final List<String> tags;

  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        tags,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(id: 1, name: 'Jinza Teriyaki', tags: ['Japanese']),
    Restaurant(id: 2, name: 'Taco Gourmet Simply Fresh', tags: ['Mexican']),
    Restaurant(id: 3, name: 'Panda Express', tags: ['Chinese']),
    Restaurant(id: 4, name: 'Qdoba', tags: ['Mexican'])
  ];

}
