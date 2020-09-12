import 'package:donateplasma/animation/FadeAnimation.dart';
import 'package:donateplasma/constants/color_constants.dart';
import 'package:donateplasma/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

import 'edit_profile.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.short_text,
            size: 40,
            color: kAccentColor,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pan_tool,
              size: 25,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              FadeAnimation(
                1.0,
                Container(
                  height: 100.0,
                  child: Center(child: Image.asset('assets/images/aaaa.png')),
                ),
              ),
              FadeAnimation(
                  2,
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black,
                              child: Text("View Profile"),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    EditProfile.routeName);
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black,
                              child: Text("Close donor availability "),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    EditProfile.routeName);
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black,
                              child: Text("Delete Profile"),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    EditProfile.routeName);
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
