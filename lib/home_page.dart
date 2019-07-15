import 'package:flutter/material.dart';

import 'Movie.dart';
import 'app_bar.dart';
import 'movie_column.dart';

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
                    child: new CustomScrollView(
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
                    ),
                  ),
                  // ),
                ), //),

                Center(
                  //child: new Expanded(
                  child: new Container(
                    child: new CustomScrollView(
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
