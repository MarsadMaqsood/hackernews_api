class Story {
  ///The item's unique id.
  final int id;

  ///Story is deleted or not
  final bool deleted;

  ///The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  final String type;

  ///The username of the item's author.
  final String by;

  ///Creation time of the story, in unix time
  final int time;

  ///Story is dead or not
  final bool dead;

  ///The ids of the item's comments, in ranked display order
  final List<dynamic> kids;

  ///In the case of stories or polls, the total comment count.
  final int descendants;

  ///The story's score, or the votes for a pollopt.
  final int score;

  ///The title of the story, poll or job.
  final String title;

  ///The URL of the story.
  ///
  ///default is `null`
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
        url: json["url"] ?? 'null',
        kids: json["kids"]?.cast<int>() ?? [],
      );
}
