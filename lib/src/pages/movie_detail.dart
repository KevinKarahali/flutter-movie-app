import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';


class MovieDetail extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

   // final movie = ModalRoute.of(context).settings.arguments;
   final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _createAppbar(movie),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _posterTitle( context ,movie),
                  _description(movie),
                  _description(movie),
                  _description(movie),
                  _description(movie),
                  _description(movie),
                  _description(movie),
                  _description(movie),
                ]
              ),
          )
        ],
      )
    );
  }

  _createAppbar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.orange,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImg()),
          placeholder: AssetImage ('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _posterTitle(BuildContext context ,Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(movie.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: Theme.of(context).textTheme.titleLarge, overflow: TextOverflow.ellipsis,),
                // Text(movie.popularity.toString()),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(movie.voteAverage.toString(), style: Theme.of(context).textTheme.subtitle1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _description(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
            textAlign: TextAlign.justify,
      ),
    );
  }
}
