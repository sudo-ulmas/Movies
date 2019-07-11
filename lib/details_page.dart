import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:movies/text_style.dart';
import 'package:video_player/video_player.dart';
import 'Movie.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;
  final bool _saved;
  DetailsPage(this.movie, this._saved);
  @override
  DetailsPageState createState() => DetailsPageState(movie, _saved);
}

class DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final Movie movie;
  final bool _saved;
  DetailsPageState(this.movie, this._saved);
  String _description="Journalist Eddie Brock is trying to take down Carlton Drake, the notorious and brilliant founder of the Life Foundation. While investigating one of Drake's experiments, Eddie's body merges with the alien Venom -- leaving him with superhuman strength and power. Twisted, dark and fueled by rage, Venom tries to control the new and dangerous abilities that Eddie finds so intoxicating";
  String _firstHalf;

  bool _isPlaying = false;
  bool _vidPlaying = false;
  bool _isTextExpanded=false;
  VideoPlayerController playerController;
  AnimationController _controller;
  Animation _animation;

  Duration _position;
  bool _visible;
  bool _isDisabled;
  
  @override
  void initState() {
    
    
    _isDisabled = false;
    _visible = true;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 200),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    
    

    if (playerController == null) {
      playerController = VideoPlayerController.asset('assets/videos/venom.mp4')
        ..addListener(() {
          Timer.run(() {
            setState(() {
              _position = playerController.value.position;
            });
          });
          setState(() {
            
          });
        })
        ..setVolume(1.0)
        ..initialize();
    }
    super.initState();
  }

  @override
  void deactivate() {
   
    super.deactivate();
    playerController.setVolume(0.0);

    playerController.dispose();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
if(_description.length> 50){
      _firstHalf=_description.substring(0,50);
     
    }
    else{
      _firstHalf=_description;
      
    }
final _synopsis= new Container(
      padding: new EdgeInsets.all(15.0),
    child:new Column(
      children: <Widget>[
         new Text(_isTextExpanded ? _description : _firstHalf),
         
        new Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new IconButton(icon: new Icon(_isTextExpanded ? Icons.expand_less : Icons.expand_more,), onPressed: () { setState(() {
             _isTextExpanded=!_isTextExpanded;
           });},)
           ],
           
         ),
        
         
      ],
    )
  );

    final play = new FloatingActionButton(
      backgroundColor: Colors.white30,
      child: Icon(
        Icons.play_arrow,
        color: Colors.white54,
        size: 45,
      ),
      onPressed:(){
        if(!_isDisabled){
          setState(() {
                playerController.play();
                _isPlaying = true;
              });
        }else{
          
             null; 
           
        }
      },
    );
    final pause = new FloatingActionButton(
      backgroundColor: Colors.white30,
      child: Icon(
        Icons.pause,
        color: Colors.white54,
        size: 45,
      ),
      onPressed: !_isDisabled
          ? () {
              setState(() {
                playerController.pause();
                _isPlaying = false;
              });
            }
          : null,
    );

    final thumbnail = new Align(
      alignment: Alignment.topCenter,
      child: new FractionallySizedBox(
          heightFactor: 0.40,
          widthFactor: 1.0,
          child: new Hero(
            tag: movie.id,
            child: new Image.asset(
              movie.image,
              fit: BoxFit.fill,
            ),
          )),
    );

    final movieInfo = new Container(
      margin: new EdgeInsets.fromLTRB(16, 20, 16, 16),
      //constraints: new BoxConstraints.expand(),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: new Color(0xd9d9d9d9),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 15.0),
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                new IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 40.0,
                      color: _saved ? Colors.red : new Color(0xe9e9e9e9),
                    ),
                    onPressed: () {}),
              ]),

          // new Container(
          //  height: 220.0,
          //),
          new Container(
            height: 25.0,
          ),
          new Center(
            child: new FloatingActionButton(
              backgroundColor: Colors.white30,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white54,
                size: 45,
              ),
              onPressed: () {
                setState(() {
                  playerController.play();

                  _vidPlaying = true;
                  _isPlaying = true;
                });
              },
            ),
          ),

          new Container(
            height: 10.0,
          ),

          Container(
            child: new Align(
              alignment: Alignment.topLeft,
              child: new Text(
                movie.title,
                textAlign: TextAlign.left,
                style: new TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          new Container(
            height: 10.0,
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
            height: 20.0,
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
        ],
      ),
    );

    final rateBorder = new Container(
      margin: const EdgeInsets.fromLTRB(50, 19, 8, 8),
      width: 50.0,
      height: 50.0,
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
          new Material(
            child: new Text(
              movie.rating,
              style: new TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );

    final video = new Container(
        child: new Column(
      children: <Widget>[
        new GestureDetector(
          onTap: () {
            if (_visible == false) {
              _visible = true;
              _controller.forward();

              _isDisabled = false;
            } else {
              _visible = false;
              _controller.animateTo(0.0);

              _isDisabled = true;
            }
          },
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: (playerController != null
                      ? VideoPlayer(playerController)
                      : Container()),
                ),
              ),
              new FadeTransition(
                opacity: _animation,
                child: new Container(
                  margin: new EdgeInsets.all(13.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: 10.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            color: new Color(0xd9d9d9d9),
                          ),
                          new IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 40.0,
                                color:
                                    _saved ? Colors.red : new Color(0xe9e9e9e9),
                              ),
                              onPressed: () {})
                        ],
                      ),
                      new Container(
                        height: 25.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          (_isPlaying ? pause : play),
                        ],
                      ),
                      new Container(
                        height: 85.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(_position.toString(),
                              style: new TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          new Text(playerController.value.duration.toString(),
                              style: new TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        new VideoProgressIndicator(
          playerController,
          allowScrubbing: true,
          padding: new EdgeInsets.only(top: 0.0),
        ),
      ],
    ));

    return new Scaffold(
        body: new Container(
            child: (_vidPlaying
                ? video
                : new Stack(
                   children: <Widget>[thumbnail, movieInfo, rateBorder],
                  ))),
                 
         
        );
  }

  

}
