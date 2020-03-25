import 'package:flutter/material.dart';

enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Hard, Challenging }

class MealDetail {
  final String id;

  const MealDetail(
      {@required this.id,
      @required this.steps,
      @required this.categories,
      @required this.title,
      @required this.affordability,
      @required this.complexity,
      @required this.imageUrl,
      @required this.duration,
      @required this.ingredients,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.isLactoseFree});

  final List<String> steps;
  final List<String> categories;
  final String title;
  final Affordability affordability;

  final Complexity complexity;
  final String imageUrl;
  final int duration;

  final List<String> ingredients;

  final bool isGlutenFree;
  final bool isVegan;

  final bool isVegetarian;

  final bool isLactoseFree;
}
