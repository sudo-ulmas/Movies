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

class DetailsPageState extends State<DetailsPage> {
  final Movie movie;
  final bool _saved;
  DetailsPageState(this.movie, this._saved);

/*VideoPlayerController playerController;
VoidCallback listener;

@override
void initState() {
    // TODO: implement initState
     listener=(){
    setState((){
      
    });
    };
    super.initState();
   
  }

@override
void deactivate() {
    // TODO: implement deactivate
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }
  void createVideo(){
    if(playerController==null){
      playerController=VideoPlayerController.asset('assets/videos/venom.mp4')
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
    }
    else if(playerController.value.isPlaying){
      playerController.pause();
    }
    else
    {
      //playerController.initialize();
      playerController.play();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final thumbnail = new Align(
      alignment: Alignment.topCenter,
      child: new FractionallySizedBox(
          heightFactor: 0.60,
          widthFactor: 1,
          child: new Hero(
            tag: movie.id,
            child: new Image.asset(
              movie.image,
              fit: BoxFit.fill,
            ),
          )),
    );

    final movieInfo = new Container(
      margin: new EdgeInsets.all(16.0),
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
                    new Hero(
                      tag: movie.id + "solid",
                      child: new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: 45.0,
                        width: 45.0,
                        decoration: new BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
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
            height: 85.0,
          ),
new Center(
  child: new FloatingActionButton(
    backgroundColor: Colors.white30,
    
    child: Icon(Icons.play_arrow,color: Colors.white54,size: 45,),
  ),
),
  

new Container(
            height:85.0,
          ),


          Container(
            child: new Align(
              alignment: Alignment.topLeft,
              child: new Hero(
                tag: movie.id + "title",
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
          ),
          new Container(
            height: 10.0,
          ),
          new Hero(
            tag: movie.id + "duration",
            child: new Row(
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

    final rateBorder = new Hero(
        tag: movie.id + "rate",
        child: new Container(
          margin: const EdgeInsets.fromLTRB(50, 12.5, 8, 8),
          width: 55.0,
          height: 55.0,
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
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ));

    return new Scaffold(
        body: new Container(
            child: new Stack(
      children: <Widget>[thumbnail, movieInfo, rateBorder],
    )));
  }
}

/*Center(
      child: AspectRatio(
        aspectRatio: 4/3,
        child: Stack(
         children: <Widget>[
           (playerController!=null ? VideoPlayer(playerController) : Container()),
           Positioned(
             top: 100,
             left:150 ,
           child:FloatingActionButton(
             onPressed: (){
               createVideo();
              
             },
             child: Icon(Icons.play_circle_outline),
           )),
         ],
        ),
      ),
    )*/
