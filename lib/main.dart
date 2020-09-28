import 'package:flutter/material.dart';
import 'package:resturant/Screens/filter_screen.dart';
import 'package:resturant/Screens/tabs_screen.dart';
import './dummy_data.dart';
import './Screens/categories_screen.dart';
import './Screens/category_meals_screen.dart';
import './Screens/meals_details_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static String keyGLUTEN = 'gluten';
  static String keyLACTOS = 'lactose';
  static String keyVEGAN = 'vegan';
  static String keyVEGETARIAN = 'vegetarian';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    MyApp.keyGLUTEN: false,
    MyApp.keyLACTOS: false,
    MyApp.keyVEGAN: false,
    MyApp.keyVEGETARIAN: false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> mapData) {
    setState(() {
      _filters = mapData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters[MyApp.keyGLUTEN] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters[MyApp.keyLACTOS] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters[MyApp.keyVEGAN] && !meal.isVegan) {
          return false;
        }
        if (_filters[MyApp.keyVEGETARIAN] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final exitstingIndex = _favoriteMeals.indexWhere((meal)=> meal.id== mealID);
    // didnt find anything
    if (exitstingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exitstingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool _isMealFav(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

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
        '/': (ctx) => TabScreen(_favoriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isMealFav),
        FilterScreen.routename: (ctx) => FilterScreen(_filters, _setFilter),
      },
      // this can bes used to handle complex structure
      // onGenerateRoute: (settings) {
      // },

      // it calls before failer of creating page/screen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
