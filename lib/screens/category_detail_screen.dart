import 'package:flutter/material.dart';

import '../model/meal_detail.dart';
import '../widgets/meal_item.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routeName = '/category-details';
  final List<MealDetail> availabelMeals;


  CategoryDetailScreen(this.availabelMeals);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String categoryTitle;
  List<MealDetail> meals;
  bool _loadedInitData = false;

  void _deleteMeal(String id) {
    setState(() {
      meals.removeWhere((test) {
        return test.id == id;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      meals = widget.availabelMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData= true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(meals[index], _deleteMeal);
          },
          itemCount: meals.length,
        ));
  }
}
