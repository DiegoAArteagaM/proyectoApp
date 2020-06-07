import 'package:flutter/material.dart';
import 'package:formvalidation/src/utils/routes_util.dart';

class Menu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image:  AssetImage('data/menu-image.jpg'))),
              child: Stack(children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text("Menú",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500))
                  ),
              ])
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.book),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("actualizar info"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.actualizar);
                
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.book),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("actualizar info"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.book),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("actualizar info"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            
          ],
        ),
      );
  }
}