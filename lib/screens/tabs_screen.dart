import 'package:flutter/material.dart';

import '../model/meal_detail.dart';
import '../screens/category_screen.dart';
import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<MealDetail> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  int _index = 0;

  void _onSelectTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Faavorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(title: Text(_pages[_index]['title'])),
          drawer: MainDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            type: BottomNavigationBarType.shifting,
            onTap: _onSelectTab,
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.category),
                  title: Text('Categories')),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites')),
            ],
          ),
          body: _pages[_index]['page']

          /* TabBarView(
          children: <Widget>[CategoryScreen(), FavoriteScreen()],
        ),*/
          ),
    );
  }
}
