import 'package:flutter/material.dart';

import 'package:social_ui/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  PageController pageController;
  String? title;
  List<Post> posts;

  PostsCarousel({
    Key? key,
    required this.pageController,
    required this.title,
    required this.posts,
  }) : super(key: key);
  _buildPostCaresoul(BuildContext ctx, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1.0;

        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          //value = index.toDouble() - (pageController.page ?? 0);
          //value = (value * 0.038).clamp(-1, 1);
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 380,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  post.imageUrl!,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      post.location!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          post.likes.toString(),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.comment,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          post.comments.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title!,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0),
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 380,
          child: PageView.builder(
            controller: pageController,
            physics: const ClampingScrollPhysics(),
            pageSnapping: true,
            itemCount: posts.length,
            itemBuilder: (ctx, index) {
              return _buildPostCaresoul(ctx, index);
            },
          ),
        )
      ],
    );
  }
}
