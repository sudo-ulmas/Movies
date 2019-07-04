import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';
import 'home_page.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MaterialApp(
title: 'Movie App',
theme: ThemeData(fontFamily: 'RaleWay',
textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),),
home: new HomePage(),
  ));
}