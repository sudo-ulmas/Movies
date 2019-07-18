import 'package:flutter/material.dart';

import 'Movie.dart';
import 'app_bar.dart';
import 'movie_column.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePages();
  }
}

class HomePages extends StatefulWidget {
  @override
  HomePagesState createState() => HomePagesState();
}

class HomePagesState extends State<HomePages> {
  PageController pageController = PageController(
    initialPage: 0,
  );
final String nowPlayingUrl =
      "http://api.themoviedb.org/3/movie/now_playing?api_key=8eb52f388e530e8db4443ca665ac6383";
  final String comingSoonUrl="https://api.themoviedb.org/3/discover/movie?api_key=8eb52f388e530e8db4443ca665ac6383&language=en-US&sort_by=release_date.asc&include_adult=false&include_video=false&page=1&primary_release_year=2019&primary_release_date.gte=2019-07-15&primary_release_date.lte=2019-09-15&year=2019";
  List data;
  List pata;
  Future<List<Movie>> updateMovies() async {
    if(movies.length==0){
    final response = await http.get(Uri.encodeFull(nowPlayingUrl),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
     
      var jSon = json.decode(response.body);
      data = jSon["results"];
      for (int i = 0; i < data.length; i++) {
        Movie m = new Movie(
          id: data[i]["id"],
          overview: data[i]["overview"],
          title: data[i]["title"],
          rating: data[i]["vote_average"],
          duration: data[i]["id"],
          premiereDate: data[i]["release_date"],
          image: "https://image.tmdb.org/t/p/w500" + data[i]["poster_path"],
        );
        movies.add(m);
      }
      
      return movies;
    } else {
      throw Exception("failed to load movie");
    }
    }
    else
    {
      return movies;
    }
  }

  Future<List<Movie>> updateUpcomingMovies() async{
    if(coming_movies.length==0){
   final response = await http.get(Uri.encodeFull(comingSoonUrl),
        headers: {"Accept": "application/json"});

        if (response.statusCode == 200) {
     
      var jSon = json.decode(response.body);
      pata = jSon["results"];
      for (int i = 0; i < pata.length; i++) {
        Movie m = new Movie(
          id: pata[i]["id"],
          overview: pata[i]["overview"],
          title: pata[i]["title"],
          rating: pata[i]["vote_average"],
          duration: pata[i]["id"],
          premiereDate: pata[i]["release_date"],
          image: "https://image.tmdb.org/t/p/w500" + pata[i]["poster_path"],
        );
        coming_movies.add(m);
      }
     
      return coming_movies;
    } else {
      throw Exception("failed to load movie");
    }
    }
    else
    {
      return coming_movies;
    }
  }
  goToPage(num page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  bool _nowShowing = true;
  bool _comingSoon = false;
  
  @override
  Widget build(BuildContext context) {
    changeButtonColor() {
      setState(() {
        _nowShowing = !_nowShowing;
        _comingSoon = !_comingSoon;
      });
    }

    void nowShowing() {
      if (!_nowShowing) {
        changeButtonColor();
        goToPage(0);
      }
    }

    void comingSoon() {
      if (!_comingSoon) {
        goToPage(1);
        changeButtonColor();
      }
    }

    return Scaffold(
      body: new Column(
        children: <Widget>[
          new CustomAppBar('Movies'),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: ButtonTheme(
                    minWidth: 162.0,
                    buttonColor: _nowShowing
                        ? Color.fromARGB(240, 246, 166, 19)
                        : const Color(0xe9e9e9e9),
                    child: RaisedButton(
                      elevation: _nowShowing ? 10.0 : 0.0,
                      //disabledElevation: 15.0,
                      child: new Text('Now Showing',
                          style: new TextStyle(
                            color: _nowShowing ? Colors.white : Colors.grey,
                            fontFamily: 'Roboto',
                          )),
                      onPressed: () => nowShowing(),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Expanded(
                  child: ButtonTheme(
                    minWidth: 162.0,
                    buttonColor: _comingSoon
                        ? Color.fromARGB(240, 246, 166, 19)
                        : const Color(0xe9e9e9e9),
                    child: RaisedButton(
                      elevation: _comingSoon ? 10.0 : 0.0,
                      child: new Text(
                        'Coming Soon',
                        style: new TextStyle(
                            color: _comingSoon ? Colors.white : Colors.grey,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => comingSoon(),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            //width: double.infinity,
            height: MediaQuery.of(context).size.height - 148,
            child: PageView(
              physics: new NeverScrollableScrollPhysics(),
              controller: pageController,
              children: <Widget>[
                // new Expanded(
                Center(
                  //  child: new Expanded(
                  child: new Container(
                    child: new FutureBuilder(
                      future: updateMovies(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return new CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: <Widget>[
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          sliver: new SliverFixedExtentList(
                            itemExtent: 470.0,
                            delegate: new SliverChildBuilderDelegate(
                              (context, index) =>
                                  new MovieColumn(movies[index]),
                              childCount: movies.length,
                            ),
                          ),
                        ),
                      ],
                    );
                    },

                    ),
                  ),
                  // ),
                ), //),

                Center(
                  //child: new Expanded(
                  child: new Container(
                   child: new FutureBuilder(
                     future: updateUpcomingMovies(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return new CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: <Widget>[
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          sliver: new SliverFixedExtentList(
                            itemExtent: 470.0,
                            delegate: new SliverChildBuilderDelegate(
                              (context, index) =>
                                  new MovieColumn(coming_movies[index]),
                              childCount: coming_movies.length,
                            ),
                          ),
                        ),
                      ],
                    );
                      },
                     
                   ),
                  ),
                  // )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
