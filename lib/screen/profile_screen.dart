import 'package:flutter/material.dart';
import 'package:social_ui/models/user_model.dart';
import 'package:social_ui/widgets/post_carousel.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/user_image.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scafflodState = GlobalKey<ScaffoldState>();
  PageController? _pageContoller, _favPageContoller;

  @override
  void initState() {
    super.initState();
    _pageContoller = PageController(initialPage: 0, viewportFraction: 0.8);
    _favPageContoller = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafflodState,

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   iconTheme: IconThemeData(
      //     color: Theme.of(context).primaryColor,
      //   ),
      //   elevation: 0,
      // ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image.asset(
                    widget.user!.backgroundImageUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    onPressed: () => _scafflodState.currentState!.openDrawer(),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                    bottom: 0.0,
                    child: UserImage(
                      profileImageUrl: widget.user!.profileImageUrl!,
                    ))
              ],
            ),
            Text(
              widget.user!.name!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user!.following.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user!.followers.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PostsCarousel(
              pageController: _pageContoller!,
              title: 'Your Posts',
              posts: widget.user!.posts!,
            ),
            PostsCarousel(
              pageController: _favPageContoller!,
              title: 'Favorites',
              posts: widget.user!.favorites!,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
