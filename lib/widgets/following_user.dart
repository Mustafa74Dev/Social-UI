import 'package:flutter/material.dart';
import 'package:social_ui/models/user_model.dart';
import 'package:social_ui/socialData/data.dart';
import '../widgets/user_image.dart';

class FollowingUser extends StatelessWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0),
          ),
        ),
        Container(
          height: 100,
          // color: Colors.blue,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 1),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                User user = users[index];
                return UserImage(profileImageUrl: user.profileImageUrl!);
              }),
        ),
      ],
    );
  }
}
