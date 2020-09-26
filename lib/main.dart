import 'package:flutter/material.dart';
import 'package:resturant/Screens/tabs_screen.dart';
import 'Screens/top_tabs_screen.dart';
import './Screens/categories_screen.dart';
import './Screens/category_meals_screen.dart';
import './Screens/meals_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 245, 222, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromARGB(255, 12, 12, 12),
            ),
            body2: TextStyle(
              color: Color.fromARGB(222, 11, 11, 12),
            ),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      /// `We can insitiate in route`
      // home: CategoriesScreen(),
      // for nevigations
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
      // this can bes used to handle complex structure
      onGenerateRoute: (settings) {

      },

      // it calls before failer of creating page/screen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
