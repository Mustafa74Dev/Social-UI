import './post_model.dart';

class User {
  String? name;
  String? profileImageUrl;
  String? backgroundImageUrl;
  int? followers;
  int? following;
  List<Post>? posts;
  List<Post>? favorites;
  User({
    this.name,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.followers,
    this.following,
    this.posts,
    this.favorites,
  });
}
