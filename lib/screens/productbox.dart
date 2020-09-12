import 'package:flutter/material.dart';

void main() => runApp(ProductBox());

class ProductBox extends StatelessWidget {
  static const routeName = '/Faq';
  ProductBox({Key key, this.name, this.description}) : super(key: key);
  final String name;
  final String description;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                        ],
                      )))
            ])));
  }
}
