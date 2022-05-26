import 'dart:convert';

class Cast {
  Cast({
    required this.adult,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.castId,
    this.character,
    this.department,
    this.job,
    this.order,
    this.profilePath,
  });

  bool adult;
  double popularity;
  int? castId;
  int gender;
  int id;
  int? order;
  String? character;
  String creditId;
  String? department;
  String? job;
  String knownForDepartment;
  String name;
  String originalName;
  String? profilePath;

  get fullProfilePath => profilePath == null
      ? 'https://i.stack.imgur.com/GNhxO.png'
      : 'https://image.tmdb.org/t/p/w500/$profilePath';

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        department: json["department"],
        gender: json["gender"],
        id: json["id"],
        job: json["job"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        order: json["order"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
