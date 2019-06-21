import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/text_style.dart';

import 'Movie.dart';



class MovieColumn extends StatelessWidget {

  final Movie movie;
  MovieColumn(this.movie);
 
  @override
  Widget build(BuildContext context) {
     final movieThumbnail = new ClipRRect(
    borderRadius: new BorderRadius.circular(20.0),
    child: new Image.asset(movie.image),
  );

  final rateBorder = new Container(
    margin: const EdgeInsets.all(17.5),
    width: 60.0,
    height: 60.0,
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      border: new Border.all(
        width: 1.0,
        color: new Color(0xd9d9d9d9),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
       movie.rating,
          style: new TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        )
      ],
    ),
  );

  final movieInfo = new Container(
    margin: new EdgeInsets.all(25.0),
    //constraints: new BoxConstraints.expand(),
    child: new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              height: 45.0,
              width: 45.0,
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            Icon(Icons.favorite, size: 40.0, color: new Color(0xe9e9e9e9)),
          ],
        ),
        new Container(
          height: 40.0,
        ),
        new Container(
          
          child: new Align(
          alignment: Alignment.center,
          child: new Text(
            movie.title,
            style: new TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white),
          ),),
        ),
        new Container(
          height: 15.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              movie.duration,
              style: Style.regularTextStyle,
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 10.0),
                height: 18.0,
                width: 0.8,
                color: new Color(0xeeeeeeee)),
            new Text(
              movie.premiereDate,
              style: Style.regularTextStyle,
            ),
          ],
        ),
        new Container(
          height: 220.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 65.0,
                    height: 25.0,
                    child: OutlineButton(
                      child: Text(
                        'Action',
                        style: Style.genreTextStyle,
                      ),
                      onPressed: () {}, //callback when button is clicked
                      borderSide: BorderSide(
                        color: new Color(0xe9e9e9e9),
                        //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1.5, //width of the border
                      ),
                    ),
                  ),
                  new Container(
                    width: 7.0,
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 25.0,
                    child: OutlineButton(
                      child: Text(
                        'Horror',
                        style: Style.genreTextStyle,
                      ),
                      onPressed: () {}, //callback when button is clicked
                      borderSide: BorderSide(
                        color: new Color(0xe9e9e9e9), //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1.5, //width of the border
                      ),
                    ),
                  )
                ],
              ),
            ),
            new ButtonTheme(
              // minWidth: 40.0,
              disabledColor: Color.fromARGB(250, 246, 166, 19),
              child: new RaisedButton(
                onPressed: null,
                child: Text(
                  'Book',
                  style: Style.regularBold,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
    return new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      child: new Stack(
        children: <Widget>[
          
          //margin: new EdgeInsets.all(10),
          movieThumbnail,
          movieInfo,
          rateBorder,
        ],
      ),
    );
  }
}
