class Note {
  Note({
    this.id,
    required this.title,
    required this.content,
  });

  int? id;
  String title;
  String content;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };

  Note copy({
    int? id,
    String? title,
    String? content,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );
}
