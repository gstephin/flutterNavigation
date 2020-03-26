import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/meal_detail.dart';

class FavoriteScreen extends StatelessWidget {
  final List<MealDetail> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        favoriteMeals.isEmpty
            ? Center(
                child:
                    Text('You have no favorites yet - start adding some!'),
              )
            : Expanded(
              child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(favoriteMeals[index], () {});
                  },
                  itemCount: favoriteMeals.length,
                ),
            )
      ],
    );
  }
}
