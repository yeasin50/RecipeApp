import 'package:flutter/material.dart';
import 'package:resturant/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/mealDetailsScreen";
  final Function _togle_fav;
  final Function _isFav;

  MealDetailsScreen(this._togle_fav, this._isFav);

  Widget buildSectiontitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildCOntainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiontitle(context, "Ingredients"),
            buildCOntainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectiontitle(context, "Steps"),
            buildCOntainer(
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      ///[ it will delete temporarily ]
      floatingActionButton: FloatingActionButton(
        child:Icon(
          _isFav(mealId)? Icons.star: Icons.star_border,// checking meal favorite or not
        ),
        onPressed:()=> _togle_fav(mealId),
        // onPressed: () {
        //   print(mealId);
        //   Navigator.of(context).pop(mealId);
        // },
      ),
    );
  }
}
