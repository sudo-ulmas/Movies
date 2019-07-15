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
  final String nowPlayingUrl =
      "http://api.themoviedb.org/3/movie/now_playing?api_key=8eb52f388e530e8db4443ca665ac6383";
  final String comingSoonUrl="https://api.themoviedb.org/3/discover/movie?api_key=8eb52f388e530e8db4443ca665ac6383&language=en-US&sort_by=release_date.asc&include_adult=false&include_video=false&page=1&primary_release_year=2019&primary_release_date.gte=2019-07-15&primary_release_date.lte=2019-09-15&year=2019";
  List data;
  List pata;
  Future<String> updateMovies() async {
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
      
      return "Success";
    } else {
      throw Exception("failed to load movie");
    }
  }

  Future<String> updateUpcomingMovies() async{
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
     
      return "Success";
    } else {
      throw Exception("failed to load movie");
    }
  }




  @override
  void initState() {
     movies.length = 0;
     coming_movies.length = 0;
     updateUpcomingMovies();
    updateMovies();
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}
