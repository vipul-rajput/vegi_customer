import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class Cart_products extends StatefulWidget{
  @override
  _Cart_productsState createState()=>_Cart_productsState();
}
class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart=[
    {
      "name": "TOMATO",
      "picture":
      "https://tse2.mm.bing.net/th?id=OIP.5p0plunsoknA3vQfIdF0tQHaE7&pid=Api&P=0&w=247&h=165",
      "price": 85,
      "quantity":1,
    },
    {
      "name": "POTATO",
      "picture":
      "https://tse2.mm.bing.net/th?id=OIP.iF50rfHpqrgyJE7DLhRbmAHaE8&pid=Api&P=0&w=234&h=157",
      "price": 50,
      "quantity":2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_pricture: Products_on_the_cart[index]["pricture"],
          );
        });
  }
}
class Single_cart_product extends StatelessWidget{
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_price;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_price,
    this.cart_prod_pricture,
    this.cart_prod_qty
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
        leading: Image.asset(cart_prod_pricture,width: 90.0,height: 90.0,),
        title:Text("$cart_prod_name"),
        subtitle: Column(
          children: <Widget>[
           Row(
             children: <Widget>[
               // this sec is for qty of product
               Padding(
                 padding: EdgeInsets.all(0.0),
                 child: Text("Qty:"),
               ),
               Padding(
                 padding: EdgeInsets.all(4.0),
                 child: Text("$cart_prod_qty",style: TextStyle(color: Colors.green),),
               ),
             ],
           ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}",style: TextStyle(fontSize:17.0,fontWeight: FontWeight.bold,
              color: Colors.green,
              ),),
            ),

          ],
        ),
        trailing: Column(
          children:<Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up),onPressed:(){} ,),
          ],
        ),
      ),
    );

  }
}