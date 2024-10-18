class UserModel {
  String uid;
  String name;
  String email;
  String imageUrl;
  String bio;
  bool isOnline;
  List<String> chatWith;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.isOnline,
    required this.bio,
    required this.chatWith
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      bio: json['bio'],
      isOnline: json['isOnline'],
      chatWith: json['chatWith'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'bio' :bio,
      'imageUrl': imageUrl,
      'isOnline': isOnline,
      'chatWith': chatWith,
    };
  }
}
