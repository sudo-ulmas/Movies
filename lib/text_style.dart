import 'package:flutter/material.dart';

class Style{

  static final headerTextStyle= const TextStyle(
fontFamily: 'Asap',
fontWeight: FontWeight.w600,
fontSize: 28.0,
color: Colors.black
  );
  static final appBarTitle= const TextStyle(
fontFamily: 'Railway',
fontWeight: FontWeight.w600,
fontSize: 28.0,
  );
  static final regularTextStyle=new TextStyle(
    color: new Color(0xe9e9e9e9),
    fontFamily: 'Roboto',
    fontSize: 13.0
  );
  static final genreTextStyle=regularTextStyle.copyWith(
fontSize: 10,
fontWeight: FontWeight.w700
  );

  static final regularBold=regularTextStyle.copyWith(
color: Colors.white,
fontWeight: FontWeight.w700,
fontSize: 15.0
  );
}