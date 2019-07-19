import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:movies/text_style.dart';
import 'package:youtube_player/youtube_player.dart';
import 'Movie.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final Movie movie;
 
  DetailsPage(this.movie);
  @override
  DetailsPageState createState() => DetailsPageState(movie);
}

class DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final Movie movie;
  
  DetailsPageState(this.movie);

  VideoPlayerController _videoController;

  List data;
  List pata;
  //bool _isPlaying = false;
  // bool _vidPlaying = false;
  bool _isTextExpanded = false;
  // VideoPlayerController playerController;
  AnimationController _controller;
  Animation _animation;
  GlobalKey _keySynopsis = GlobalKey();
  Duration _position;
  bool _visible;
  bool _isDisabled;

  Future<String> getYouTubeKey() async {
    String url = "https://api.themoviedb.org/3/movie/" +
        movie.id.toString() +
        "/videos?api_key=8eb52f388e530e8db4443ca665ac6383&language=en-US";

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "Application/json"});
    if (response.statusCode == 200) {
      var jSon = json.decode(response.body);
      data = jSon["results"];
      String _source = data[0]["key"];
      return _source;
    } else {
      throw Exception("cant load a video");
    }
  }

  Future<List<String>> getCast() async {
    String url = "https://api.themoviedb.org/3/movie/" +
        movie.id.toString() +
        "/credits?api_key=8eb52f388e530e8db4443ca665ac6383";

    var response = await http.get(Uri.encodeFull(url));
    var jSon = json.decode(response.body);
    pata = jSon["cast"];
    List<String> cast = new List();
    for (int i = 0; i < pata.length; i++) {
      cast.add(pata[i]["profile_path"]);
    }
    return cast;
  }

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

    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    // playerController.setVolume(0.0);

    _videoController.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _description = movie.overview;
    String _firstHalf;
    if (_description.length > 175) {
      _firstHalf = _description.substring(0, 175);
    } else {
      _firstHalf = _description;
    }
    ListView _synopsis() {
      return new ListView(
        children: <Widget>[
          Container(
            key: _keySynopsis,
            padding: new EdgeInsets.fromLTRB(20, 270.0, 20, 0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.fromLTRB(0, 0, 0, 13),
                  child: new Text("Synopsis",
                      style: new TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  alignment: Alignment.centerLeft,
                ),
                new Text(
                  _isTextExpanded ? _description : _firstHalf,
                  style: new TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black54),
                ),
                new IconButton(
                  color: Colors.black26,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.topLeft,
                  // iconSize: 1.0,
                  icon: new Icon(
                    _isTextExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _isTextExpanded = !_isTextExpanded;
                    });
                  },
                )
              ],
            ),
          ),
          new Container(
            // margin: new EdgeInsets.only(top: 0),
            padding: new EdgeInsets.fromLTRB(20, 20, 0, 0),
            color: Colors.black12,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Cast",
                      style: new TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      child: new FutureBuilder(
                        future: getCast(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return new Container();
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              padding: new EdgeInsets.fromLTRB(0, 5, 5, 5),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: new EdgeInsets.fromLTRB(0, 0, 10, 10),
                                  child: new ClipRRect(
                                    borderRadius: new BorderRadius.circular(5),
                                    child: Image.network(
                                        "https://image.tmdb.org/t/p/w200" +
                                            snapshot.data[index]),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                )),
          )
        ],
      );
    }

    final thumbnail = new Align(
      alignment: Alignment.topCenter,
      child: new FractionallySizedBox(
          heightFactor: 0.40,
          widthFactor: 1.0,
          child: new Hero(
            tag: movie.id,
            child: new Image.network(
              movie.image,
              fit: BoxFit.fill,
            ),
          )),
    );

    Widget _videoPlayer() {
      return new FutureBuilder(
          future: getYouTubeKey(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return new Stack(
                children: <Widget>[
                  YoutubePlayer(
                    showThumbnail: false,
                    context: context,
                    source: 'adfadf',
                    quality: YoutubeQuality.LOW,
                    aspectRatio: 4 / 3,
                    autoPlay: false,
                    loop: false,
                    reactToOrientationChange: false,
                    startFullScreen: false,
                    controlsActiveBackgroundOverlay: true,
                    controlsTimeOut: Duration(seconds: 4),
                    playerMode: YoutubePlayerMode.DEFAULT,
                    callbackController: (controller) {
                      _videoController = controller;
                    },
                    onError: (error) {
                      print(error);
                    },
                  ),
                  thumbnail,
                ],
              );
            } else {
              return YoutubePlayer(
                showThumbnail: true,
                context: context,
                source: snapshot.data,
                quality: YoutubeQuality.LOW,
                aspectRatio: 4 / 3,
                autoPlay: false,
                loop: false,
                reactToOrientationChange: false,
                startFullScreen: false,
                controlsActiveBackgroundOverlay: true,
                controlsTimeOut: Duration(seconds: 4),
                playerMode: YoutubePlayerMode.DEFAULT,
                callbackController: (controller) {
                  _videoController = controller;
                },
                onError: (error) {
                  print(error);
                },
              );
            }
          });
    }

    Container _bookButton() {
      return new Container(
          width: double.infinity,
          height: 40.0,
          margin:
              new EdgeInsets.only(top: MediaQuery.of(context).size.height - 40),
          child: new ButtonTheme(
            // minWidth: 40.0,
            buttonColor: Color.fromARGB(250, 246, 166, 19),
            child: new RaisedButton(
              onPressed: () {},
              child: new Text(
                'Book Now',
                style: new TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0),
              ),
            ),
          ));
    }

    return new Scaffold(
        body: new Container(
      constraints: new BoxConstraints.expand(),
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          _synopsis(),
          _videoPlayer(),
          _bookButton(),
        ],
      ),
    ));
  }
}
