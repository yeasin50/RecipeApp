import 'package:flutter/material.dart';
import 'package:resturant/models/meal.dart';
import 'package:resturant/widget/main_drawer.dart';
import './categories_screen.dart';
import './favoriteScreen.dart';

class TabScreen extends StatefulWidget {
  List<Meal> _favoriteMeals;

  TabScreen(this._favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> _pages;
  int _selectedPage = 0;

/// we cannt get widget that's why we need to override initstate to get fav meals and pass through
  @override
  void initState() {
    _pages =[
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget._favoriteMeals), 'title': 'Favorite'}
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPage]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPage,
          // type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("Categories"),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text("Favorite"),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ));
  }
}
