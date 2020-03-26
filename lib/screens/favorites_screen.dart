import '../util/kf_drawer.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/meal_detail.dart';

class FavoriteScreen extends KFDrawerContent {
  final List<MealDetail> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        widget.favoriteMeals.isEmpty
            ? Center(
                child:
                    Text('You have no favorites yet - start adding some!'),
              )
            : Expanded(
              child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(widget.favoriteMeals[index], () {});
                  },
                  itemCount: widget.favoriteMeals.length,
                ),
            )
      ],
    );
  }
}
