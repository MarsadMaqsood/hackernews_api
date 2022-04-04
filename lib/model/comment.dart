class Comment {
  final int id;
  final String text;
  final String by;
  final String type;

  final int parent;
  final int time;
  final bool dead;
  final bool deleted;
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
