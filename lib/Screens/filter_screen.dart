import 'package:flutter/material.dart';
import 'package:resturant/widget/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routename = "filter_screen";
  const FilterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Options"),
      ),
      drawer: MainDrawer(),
      body: Text("asds"),
    );
  }
}
