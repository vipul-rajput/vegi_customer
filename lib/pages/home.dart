import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:test1_vegifresh/components/horizontal_listview.dart';
import 'package:test1_vegifresh/components/products.dart';
import 'package:test1_vegifresh/pages/cart.dart';
// ignore: implementation_imports
import 'package:flutter/src/painting/image_resolution.dart';

import 'login.dart';
// TODO: Copy code from main of Saurabh and replace here refer vid 24
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/Slider/slider_vegetables2.jpg"),
          AssetImage("images/Slider/slider_vegetables1.jpg"),
          AssetImage("images/Slider/slider_vegetables3.jpeg"),
          AssetImage("images/Slider/slider_vegetables4.jpg"),
          AssetImage("images/Slider/slider_vegetables5.png"),
        ],
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
        dotBgColor: Colors.transparent,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.green,
        title: Text("vegiFRESH"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text("Customer1"),
              accountEmail: Text("Customer1@gmail.com"),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )),
              decoration: new BoxDecoration(
                color: Colors.green,
              ),
            ),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home Page"),
                  leading: Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                )),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                )),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.green,
                  ),
                )),

            InkWell(
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
                onTap: () {Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));},
              ),
            ),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Favorites"),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                )),
            Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Setting"),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                )),
            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,
          //padding widget
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Categories"),
          ),
          new HorizontalList(),

          new Padding(
            padding: EdgeInsets.all(20.0),
            child: new Text('Recent Products'),
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
