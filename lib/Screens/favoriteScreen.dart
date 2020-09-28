import 'package:flutter/material.dart';
import 'package:resturant/models/meal.dart';
import 'package:resturant/widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favMeals;

  FavoriteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text("Start Adding to Favorite "),
      );
    } else {
      return ListView.builder(
          itemCount: favMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favMeals[index].id,
              title: favMeals[index].title,
              imageUrl: favMeals[index].imageUrl,
              duration: favMeals[index].duration,
              complexity: favMeals[index].complexity,
              affordability: favMeals[index].affordability,
            );
          });
    }
  }
}
