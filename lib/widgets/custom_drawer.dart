import 'package:flutter/material.dart';
import 'package:social_ui/screen/home_screen.dart';
import 'package:social_ui/screen/login_screen.dart';
import 'package:social_ui/screen/profile_screen.dart';
import 'package:social_ui/socialData/data.dart';
import '../widgets/user_image.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildDrawerOption(Icon icon, String title, VoidCallback onTap) {
      return ListTile(
        leading: icon,
        title: Text(title),
        onTap: onTap,
      );
    }

    onOptionTap() {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/user_background.jpg',
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    UserImage(profileImageUrl: 'assets/images/user6.jpg'),
                    const Text(
                      'Mustafa Shaikh',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            onOptionTap,
          ),
          _buildDrawerOption(
            const Icon(Icons.chat),
            'Chat',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.location_on),
            'Map',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.settings),
            'Setting',
            () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
