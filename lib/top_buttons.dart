import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
    margin: new EdgeInsets.symmetric(horizontal: 24.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
       //mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         
         Expanded(
           
          child:ButtonTheme(
            
            minWidth: 162.0,
            disabledColor:Color.fromARGB(240, 246, 166, 19),
         child: RaisedButton(
           
           disabledElevation: 15.0,
           child: new Text('Now Showing',style: new TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
           )),
           onPressed: null,
           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
         ),),),
         Expanded(
          child:ButtonTheme(
            minWidth:162.0,
            disabledColor:const Color(0xe9e9e9e9),
           child:RaisedButton(
           child: new Text('Coming Soon',style: new TextStyle(
             color: Colors.grey,
             fontFamily: 'Roboto',
             fontWeight: FontWeight.w500
           ),),
           onPressed: null,
           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
         ),
          ),),
       ],
     ),
      );
    
  }

}

/*child: ButtonBar(
       mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             RaisedButton(
               
               child: new Text('Now Showing'),
               onPressed: null,
             ),
              RaisedButton(
               child: new Text('Coming Soon'),
               onPressed: null,
             )
           ], 
          ),*/