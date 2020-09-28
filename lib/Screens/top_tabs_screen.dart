import 'package:flutter/material.dart';
import 'package:resturant/Screens/categories_screen.dart';
import 'package:resturant/Screens/favoriteScreen.dart';

///[ we not gonna use this dart file]
class TopTabsScreen extends StatefulWidget {
  TopTabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TopTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: "Categories",
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          // order of tabs should match this order
          CategoriesScreen(),
          // FavoriteScreen(),
        ],),
      ),
    );
  }
}
