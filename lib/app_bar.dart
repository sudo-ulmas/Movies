import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar(this.title);
  final double barHeight = 76.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      margin: new EdgeInsets.symmetric(horizontal: 24.0),
      padding: new EdgeInsets.only(top: statusBarHeight),
      //color: Colors.white,

      height: barHeight + statusBarHeight,
      //constraints: new BoxConstraints.expand(),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Text(
              title,
              style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800),
            ),
          ),
          new Expanded(
            flex: 1,
            child:Container(
              margin: new EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                
                Icons.tune,
                color: const Color(0xd9d9d9d9),
                size: 32.0,
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 12.0),
                height: 31.0,
                width: 1.5,
                color: const Color(0xeeeeeeee),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xd9d9d9d9),
                backgroundImage: AssetImage('assets/images/1.jpg'),
                radius: 18.0,
              )
            ],
          ))),
        ],
      ),
    );
  }
}
