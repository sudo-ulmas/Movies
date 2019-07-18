import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';
import 'Movie.dart';
import 'home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MaterialApp(
    title: 'Movie App',
    theme: ThemeData(
      fontFamily: 'RaleWay',
    ),
    home: MoviesData(),
  ));
}

class MoviesData extends StatefulWidget {
  @override
  MoviesDataState createState() => MoviesDataState();
}

class MoviesDataState extends State<MoviesData> {
  




  @override
  void initState() {
     movies.length = 0;
     coming_movies.length = 0;
   
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}
