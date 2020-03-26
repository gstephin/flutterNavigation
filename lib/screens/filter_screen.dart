import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function handler;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.handler);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isLactoseFree = widget.filters['sugar'];
    _isVegetarian = widget.filters['vegetarian'];
    _isVegan = widget.filters['vegan'];
    _isGlutenFree = widget.filters['gluten'];
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subTitle, bool flag, Function updateValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SwitchListTile.adaptive(
        subtitle: Text(title),
        title: Text(subTitle),
        onChanged: updateValue,
        value: flag,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'vegetarian': _isVegetarian,
                'sugar': _isLactoseFree,
                'vegan': _isVegan,
              };
              widget.handler(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Set your filters here',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                    'Gluten Free',
                    'Only include glutten free meals..!',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Vegan Meals', 'Only include vegan free meals..!', _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                buildSwitchTile(
                    'Sugar Free',
                    'Only include Sugar free meals..!',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Vegetarian meals',
                    'Only include vegetarian meals..!',
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
