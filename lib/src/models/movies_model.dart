class Movies{
  List<Movie> items = [];
  Movies();
  Movies.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final movie = Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}

class Movie {
  late String posterPath;
  late bool adult;
  late String overview;
  late DateTime releaseDate;
  late List<int> genreIds;
  late int id;
  late String originalTitle;
  late String originalLanguage;
  late String title;
  late String backdropPath;
  late double popularity;
  late int voteCount;
  late bool video;
  late double voteAverage;

  Movie(this.posterPath, this.adult, this.overview, this.releaseDate,
      this.genreIds, this.id, this.originalTitle, this.originalLanguage,
      this.title, this.backdropPath, this.popularity, this.voteCount,
      this.video, this.voteAverage);

  Movie.fromJsonMap(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = DateTime.parse(json['release_date']);
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
  }
}