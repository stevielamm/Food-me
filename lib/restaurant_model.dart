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
    Restaurant(id: 4, name: 'Hibachi-San', tags: ['Japanese']),
    Restaurant(id: 5, name: 'Restaurant At Kellogg Ranch', tags: ['American']),
    Restaurant(id: 6, name: 'VITA Italian Bar and Grill', tags: ['Italian']),
    Restaurant(id: 7, name: 'Subway', tags: ['American']),
    Restaurant(id: 8, name: 'Koji Ramen Japanese Restaurant', tags: ['Japanese']),
    Restaurant(id: 9, name: 'O Sushi A Grill', tags: ['Japanese']),
    Restaurant(id: 10, name: 'Mr. Poke', tags: ['Japanese']),
    Restaurant(id: 11, name: 'Mazesoba Hero', tags: ['Asian']),
    Restaurant(id: 12, name: 'Smoke And Fire Social Eatery', tags: ['American']),








  ];

}
