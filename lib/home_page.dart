import 'package:flutter/material.dart';
import 'package:movies/top_buttons.dart';

import 'app_bar.dart';
import 'movie_column.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:new Column(
      children: <Widget>[
        new CustomAppBar('Movies'),
        new TopButtons(),
        new MovieColumn(),
      ],
    ),
    );
  }



}