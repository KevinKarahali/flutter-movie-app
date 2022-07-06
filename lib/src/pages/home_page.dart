import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  final MoviesProvider moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Movies App'),
          backgroundColor: Colors.indigoAccent,
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
      future: moviesProvider.getMovies(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        moviesProvider.getMovies();
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
        children: <Widget>[
          Text('Populate movies', style: Theme.of(context).textTheme.subtitle1),
          FutureBuilder(
              future: moviesProvider.getPopularMovies(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                snapshot.data.forEach((movie) => print(movie.title));
                return Container();
              })
        ],
      ),
    );
  }
}
