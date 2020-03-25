import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../model/dummy_data.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-details';

  // CategoryDetailScreen(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final meals = DUMMY_MealDetailS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(meals[index]);
          },
          itemCount: meals.length,
        ));
  }
}
