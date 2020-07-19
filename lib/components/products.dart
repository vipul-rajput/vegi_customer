import 'package:test1_vegifresh/pages/veg_details.dart';
import 'package:flutter/material.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    {
      "name": "FENEGREEK",
      "picture":
      "https://dishnthekitchen.files.wordpress.com/2017/01/methi.jpg",
      "market_price": 100,
      "price": 50,
    },
    {
      "name": "BRINJAL",
      "picture":
      "https://tse3.mm.bing.net/th?id=OIP.dZdNylNu8C6URgIh_PiaaAHaEK&pid=Api&P=0&w=272&h=154",
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
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_market_price: product_list[index]['market_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_market_price;
  final prod_price;


  Single_prod({
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