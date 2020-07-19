import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/Catagory/cat5.jpg',
            image_caption: 'Fruits',
          ),
          Category(
            image_location: 'images/Catagory/cat2.png',
            image_caption: 'Salad',
          ),

          Category(
            image_location: 'images/Catagory/cat3.jpg',
            image_caption: 'Beetroot',
          ),

          Category(
            image_location: 'images/Catagory/cat4.jpg',
            image_caption: 'Root',
          ),


          Category(
            image_location: 'images/Catagory/cat1.jpg',
            image_caption: 'Leafy',
          ),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,
              height: 80.0,
              width: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child :Text(image_caption,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),),
            ),
          ),


        ),
      ),
    );
  }
}
