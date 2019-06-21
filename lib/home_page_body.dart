import 'package:flutter/material.dart';
import 'package:movies/movie_column.dart';

import 'Movie.dart';


class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
      child: new Container(
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 470.0,
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new MovieColumn(movies[index]),
                  childCount: movies.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
