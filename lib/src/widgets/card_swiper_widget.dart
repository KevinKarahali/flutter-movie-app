import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;


    return Container(
      padding: EdgeInsets.only( top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRect(
            child:FadeInImage(
              image: NetworkImage(movies[index].getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
            )
          );
        },
        itemCount: 3,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}
