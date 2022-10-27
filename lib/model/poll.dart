class Poll {
  ///The item's unique [id].
  final int id;

  ///The comment, story or poll text. HTML.
  final String text;

  ///The title of the story, poll or job.
  final String title;

  ///The story's score, or the votes for a pollopt.
  final int score;

  ///In the case of stories or polls, the total comment count.
  final int descendants;

  ///The username of the item's author.
  final String by;

  ///The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  final String type;

  ///story parent
  final int parent;

  ///Creation time of the story, in unix time
  final int time;

  ///Story is dead or not
  final bool dead;

  ///Story is deleted or not
  final bool deleted;

  ///The ids of the item's comments, in ranked display order
  final List<dynamic> kids;

  ///A list of related pollopts, in display order.
  final List<dynamic> parts;

  Poll({
    required this.id,
    required this.text,
    required this.title,
    required this.score,
    required this.descendants,
    required this.by,
    required this.type,
    required this.parent,
    required this.time,
    required this.dead,
    required this.deleted,
    required this.kids,
    required this.parts,
  });

  factory Poll.fromJson(json) {
    return Poll(
      id: json['id'],
      text: json["text"],
      title: json["title"],
      score: json["score"],
      descendants: json["descendants"],
      by: json['by'],
      type: json['type'],
      parent: json['parent'],
      time: json['time'],
      dead: json['dead'] ?? false,
      deleted: json['deleted'] ?? false,
      kids: json['kids']?.cast<int>() ?? [],
      parts: json['parts']?.cast<int>() ?? [],
    );
  }
}
