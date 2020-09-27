import 'package:flutter/material.dart';
import 'package:resturant/Screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function onTaphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTaphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        // heading
        Container(
          height: 120,
          width: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          child: Text(
            "Cooling Up",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ), // end of header
        SizedBox(
          height: 20,
        ),
        buildListTile(
          "Meal",
          Icons.restaurant,
          () {
            /// [pushReplacementNamed] replace inplace stacking pages also increase performenc.
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
        }),
      ],
    ));
  }
}
