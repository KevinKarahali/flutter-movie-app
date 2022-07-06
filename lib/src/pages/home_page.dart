import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';
import 'package:movies/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  final MoviesProvider moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopularMovies();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Movies App'),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_swiperTargets(), _footer(context)]),
        ));
  }

  Widget _swiperTargets() {
    return FutureBuilder(
      future: moviesProvider.getMoviesCinema(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        moviesProvider.getMoviesCinema();
        if (snapshot.hasData) {
          return CardSwiper(
            movies: snapshot.data,
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        // return CardSwiper(movies: snapshot.data,);
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Popular movies', style: Theme
                .of(context)
                .textTheme
                .subtitle1),
          ),
          SizedBox(height: 10.0),

          StreamBuilder(
              stream: moviesProvider.popularStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  return MovieHorizontal(movies: snapshot.data, nextPage: moviesProvider.getPopularMovies,);
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
