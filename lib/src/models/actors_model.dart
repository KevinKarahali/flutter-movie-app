class Cast {
  List<Actor> actors = [];

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) {
      final actor = Actor.fromJsonMap(element);
      actors.add(element);
    });
  }
}

class Actor {
  late bool adult;
  late int gender;
  late int id;
  late String knowForDepartment;
  late String name;
  late String originalName;
  late double popularity;
  late String profilePath;
  late int castId;
  late String character;
  late String creditId;
  late int order;
  late String job;

  Actor(
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.knowForDepartment,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  );

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knowForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['oder'];
  }

  getPhoto() {
    if (profilePath == null) {
      return 'https://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
