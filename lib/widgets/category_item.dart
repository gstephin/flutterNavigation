import 'package:flutter/material.dart';

import '../screens/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem(this.title, this.id, this.color);

  void onSelectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryDetailScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => onSelectCategory(context),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: [color.withOpacity(.7), color]),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
