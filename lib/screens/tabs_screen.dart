import 'package:daily_meals/util/kf_drawer.dart';
import 'package:flutter/material.dart';

import '../model/meal_detail.dart';
import '../screens/category_screen.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<MealDetail> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  List<Map<String, Object>> _pages;
  KFDrawerController _drawerController;

  int _index = 0;

  void _onSelectTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();

    /*  _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Faavorites'}
    ];*/
    _drawerController = KFDrawerController(
      initialPage: CategoryScreen(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Categories', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.category, color: Colors.white),
          page: CategoryScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Favorites',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.favorite, color: Colors.white),
          page: FavoriteScreen(widget.favoriteMeals),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //    appBar: AppBar(title: Text(_pages[_index]['title'])),

        //drawer: MainDrawer(),
        /*     bottomNavigationBar: BottomNavigationBar(
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
        )*/
        body: KFDrawer(
      controller: _drawerController,
      header: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Image.asset(
            'assets/images/ic_empty.png',
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      footer: KFDrawerItem(
        text: Text(
          'SIGN IN',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.input,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(255, 255, 255, 1.0),
            Color.fromRGBO(44, 72, 171, 1.0)
          ],
          tileMode: TileMode.repeated,
        ),
      ),
    )

        /* TabBarView(
        children: <Widget>[CategoryScreen(), FavoriteScreen()],
      ),*/
        );
  }
}
