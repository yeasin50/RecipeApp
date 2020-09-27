import 'package:flutter/material.dart';
import 'package:resturant/widget/main_drawer.dart';
import './categories_screen.dart';
import './favoriteScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Favorite'}
  ];
  int _selectedPage = 0;

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
