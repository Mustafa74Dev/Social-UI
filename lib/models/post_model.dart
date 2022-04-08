import './user_model.dart';

class Post {
  String? imageUrl;
  User? author;
  String? title;
  String? location;
  int? likes;
  int? comments;
  Post({
    this.imageUrl,
    this.author,
    this.title,
    this.location,
    this.likes,
    this.comments,
  });
}
