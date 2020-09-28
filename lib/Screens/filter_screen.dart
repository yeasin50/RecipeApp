import 'package:flutter/material.dart';
import 'package:resturant/main.dart';
import 'package:resturant/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = "filter_screen";

  final Function saveFilter;
  final Map<String, bool> filter;
  FilterScreen(this.filter, this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFre = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosFree = false;

  @override
  initState() {
    _glutenFre = widget.filter[MyApp.keyGLUTEN];
    _lactosFree = widget.filter[MyApp.keyLACTOS];
    _vegan = widget.filter[MyApp.keyVEGAN];
    _vegetarian = widget.filter[MyApp.keyVEGETARIAN];
    super.initState();
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter Options"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  MyApp.keyGLUTEN: _glutenFre,
                  MyApp.keyLACTOS: _lactosFree,
                  MyApp.keyVEGAN: _vegan,
                  MyApp.keyVEGETARIAN: _vegetarian
                };
                widget.saveFilter(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile("Gluten-free",
                      'Only Include gluten-free meals.',
                       _glutenFre, 
                       (newVal) {
                    setState(() {
                      _glutenFre = newVal;
                    });
                  }),
                  _buildSwitchTile(
                      "Lactose-free",
                      'Only Include lactose-free meals.',
                      _lactosFree,
                       (newVal) {
                    setState(() {
                      _lactosFree = newVal;
                    });
                  }),
                  _buildSwitchTile("Vegan", 
                  'Only Include Vegan meals.', 
                  _vegan,
                      (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                  _buildSwitchTile("Vegetarian",
                      'Only Include Vegetarian meals.',
                       _vegetarian,
                        (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
