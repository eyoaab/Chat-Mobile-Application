class MessageEntity {
  String sender;
  String content;
  bool isVisited;
  DateTime createdAt;

  MessageEntity({
    required this.sender,
    required this.content,
    required this.createdAt,
    required this.isVisited,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'content': content,
      'isVisited': isVisited,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      sender: json['sender'],
      content: json['content'],
      isVisited: json['isVisited'],
      createdAt: DateTime.parse(json['createdAt']), 
    );
  }
}
