import 'package:flutter/material.dart';
import 'package:resturant/widget/meal_item.dart';
import '../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> filterMeals;
  CategoryMeals(this.filterMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadInitData = false;

  /// [dummy deletation]
  void _removeMeal(String id) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final String categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = widget.filterMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemCount: displayMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayMeals[index].id,
                title: displayMeals[index].title,
                imageUrl: displayMeals[index].imageUrl,
                duration: displayMeals[index].duration,
                complexity: displayMeals[index].complexity,
                affordability: displayMeals[index].affordability,
                // removeItem: _removeMeal,
              );
            }));
  }
}
