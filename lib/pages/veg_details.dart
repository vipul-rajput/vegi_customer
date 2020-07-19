import 'package:flutter/material.dart';
import 'package:test1_vegifresh/main.dart';
import 'home.dart';

class VegitablesDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_pricture;
  final product_detail_market_price;
  final product_detail_price;

  VegitablesDetails({
    this.product_detail_name,
    this.product_detail_pricture,
    this.product_detail_market_price,
    this.product_detail_price,
});

@override
_VegitablesDetailState createState() => _VegitablesDetailState();
}
class _VegitablesDetailState extends State<VegitablesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.green,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
          child: Text("vegiFRESH"),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}
              ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: Image(
                    image: NetworkImage((widget.product_detail_pricture)),
                    fit: BoxFit.cover,
                  )),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800)),
                  title: new Row(children: <Widget>[
                    Expanded(
                        child: new Text(
                            "\$${widget.product_detail_market_price}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.lineThrough))),
                    Expanded(
                        child: new Text("\$${widget.product_detail_price}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ]),
                ),
              ),
            ),
          ),
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                                title: new Text("Quantity"),
                                content: new Text("Choose the Quantity"),
                                actions: <Widget>[
                                  new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close"),
                                  )
                                ]);
                          });
                    },
                    color: Colors.lightGreen[50],
                    textColor: Colors.green,
                    elevation: 0.2,
                    child: Row(children: <Widget>[
                      Expanded(child: new Text("Quantity")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ]))),
            Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                                title: new Text("Quantity"),
                                content: new Text("Choose the Quality"),
                                actions: <Widget>[
                                  new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close"),
                                  )
                                ]);
                          });
                    },
                    color: Colors.lightGreen[50],
                    textColor: Colors.green,
                    elevation: 0.2,
                    child: Row(children: <Widget>[
                      Expanded(child: new Text("Quality")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ]))),
            Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                                title: new Text("-----"),
                                content: new Text("Choose the -----"),
                                actions: <Widget>[
                                  new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close"),
                                  )
                                ]);
                          });
                    },
                    color: Colors.lightGreen[50],
                    textColor: Colors.green,
                    elevation: 0.2,
                    child: Row(children: <Widget>[
                      Expanded(child: new Text("-----")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ]))),
          ]),
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: new Text("Add to Cart"),
                      ),
                      new IconButton(
                          icon: Icon(Icons.add_shopping_cart,
                              color: Colors.white)),
                      new IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: Colors.white)),
                    ])))
          ]),
          Divider(color: Colors.green[200], thickness: 1),
          new ListTile(
            title: new Text("List of nearby FARMERS"),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
          child: Text("Similar Products"),
          ),
          Container(
            height: 340.0,
            child:Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget{
  @override
  _Similar_productsState createState()=>_Similar_productsState();
}
class _Similar_productsState extends State<Similar_products>{

  var product_list = [
    {
      "name": "TOMATO",
      "picture":
      "https://tse2.mm.bing.net/th?id=OIP.5p0plunsoknA3vQfIdF0tQHaE7&pid=Api&P=0&w=247&h=165",
      "market_price": 120,
      "price": 85,
    },
    {
      "name": "POTATO",
      "picture":
      "https://tse2.mm.bing.net/th?id=OIP.iF50rfHpqrgyJE7DLhRbmAHaE8&pid=Api&P=0&w=234&h=157",
      "market_price": 100,
      "price": 50,
    },
    {
      "name": "ONION",
      "picture":
      "https://tse1.explicit.bing.net/th?id=OIP.YYdRZn5jU2b2by9dwCF5KQHaDt&pid=Api&P=0&w=341&h=171",
      "market_price": 100,
      "price": 50,
    },
    {
      "name": "CARROT",
      "picture":
      "https://tse2.mm.bing.net/th?id=OIP.HJ1GybYAMddPVos5Ho2t9QHaFj&pid=Api&P=0&w=240&h=181",
      "market_price": 100,
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_market_price: product_list[index]['market_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_market_price;
  final prod_price;


  Similar_Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_market_price,
    this.prod_price,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new VegitablesDetails(
                  product_detail_name: prod_name,
                  product_detail_pricture: prod_pricture,
                  product_detail_market_price: prod_market_price,
                  product_detail_price: prod_price,
                ),),),
              child: GridTile(
                  footer: Container(
                    color: Colors.lightGreen[50],
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.green[400],
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_market_price",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),),),
                  ),
                  child: Image(
                    image: NetworkImage((prod_pricture)),
                    fit: BoxFit.cover,
                  )),
            ),
          )
      ),);
  }
}