class Story {
  final int id;

  ///Story is deleted or not
  final bool deleted;

  ///Story type
  final String type;

  ///Author
  final String by;

  ///creation time of the story
  final int time;

  ///Story is dead or not
  final bool dead;

  final List<dynamic> kids;
  final int descendants;

  final int score;

  final String title;
  final String url;

  Story({
    required this.id,
    required this.deleted,
    required this.type,
    required this.by,
    required this.time,
    required this.dead,
    required this.kids,
    required this.descendants,
    required this.score,
    required this.title,
    required this.url,
  });

  factory Story.fromJson(json) => Story(
        id: json['id'],
        deleted: json['deleted'] ?? false,
        type: json['type'],
        by: json["by"],
        time: json["time"],
        dead: json["dead"] ?? false,
        descendants: json["descendants"] ?? 0,
        score: json["score"],
        title: json["title"],
        url: json["url"],
        kids: json["kids"]?.cast<int>() ?? [],
      );
}
