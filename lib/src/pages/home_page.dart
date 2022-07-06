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
          children:[
            _swiperTargets(),
          ]
        ),
      )
    );
  }

  Widget _swiperTargets(){

    return FutureBuilder(
        future: moviesProvider.getPopular(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          moviesProvider.getPopular();
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

}
