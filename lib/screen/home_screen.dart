import 'package:flutter/material.dart';
import 'package:social_ui/socialData/data.dart';
import '../widgets/following_user.dart';
import '../widgets/post_carousel.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageContoller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageContoller = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageContoller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerScrimColor: Theme.of(context).primaryColor,

      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            letterSpacing: 10,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          physics: const BouncingScrollPhysics(),
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          const FollowingUser(),
          PostsCarousel(
            pageController: _pageContoller!,
            title: 'Post',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
