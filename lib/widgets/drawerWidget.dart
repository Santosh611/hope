import 'package:donateplasma/screens/FAQ.dart';
import 'package:donateplasma/screens/HomeScreen.dart';
import 'package:donateplasma/screens/Settings.dart';
import 'package:donateplasma/screens/edit_profile.dart';
import 'package:donateplasma/screens/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  static const routeName = '/CustomerDrawer';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180.0,
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 20, 20),
                  child: Text(
                    'H.O.P.E. \n \nHighly Optimized Plasma Exchange',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.deepPurple.shade700,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.leaf,
              color: Colors.blueAccent.shade700,
            ),
            title: Text('Be a donor'),
            onTap: () {
              Navigator.of(context).pushNamed(EditProfile.routeName);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.shareAlt,
              color: Colors.pinkAccent.shade400,
            ),
            title: Text('Share your story'),
            onTap: () {
              Navigator.of(context).pushNamed(StoryScreen.routeName);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.comment,
              color: Colors.yellowAccent.shade400,
            ),
            title: Text('Faq'),
            onTap: () {
              Navigator.of(context).pushNamed(Faq.routeName);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.slidersH,
              color: Colors.pinkAccent.shade400,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pushNamed(Settings.routeName);
            },
          ),
        ],
      ),
    );
  }
}
