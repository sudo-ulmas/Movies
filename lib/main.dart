import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';
import 'home_page.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MaterialApp(
title: 'Movie App',
theme: ThemeData(fontFamily: 'RaleWay',
),
home: new HomePage(),
  ));
}