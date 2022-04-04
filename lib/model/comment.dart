class Comment {
  ///id
  final int id;

  ///Text of the story
  final String text;

  ///Author
  final String by;

  ///Story type
  final String type;

  ///story parent
  final int parent;

  ///Timestamp of the story
  ///
  ///[time] is in unix time
  final int time;

  ///Story is dead or not
  final bool dead;

  ///Story is deleted or not
  final bool deleted;

  ///Kids of the story
  final List<dynamic> kids;

  Comment({
    required this.id,
    required this.text,
    required this.by,
    required this.type,
    required this.parent,
    required this.time,
    required this.dead,
    required this.deleted,
    required this.kids,
  });

  factory Comment.fromJson(json) {
    return Comment(
      id: json['id'],
      text: json["text"],
      by: json['by'],
      type: json['type'],
      parent: json['parent'],
      time: json['time'],
      dead: json['dead'] ?? false,
      deleted: json['deleted'] ?? false,
      kids: json['kids']?.cast<int>() ?? [],
    );
  }
}
