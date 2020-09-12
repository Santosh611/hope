import 'package:donateplasma/constants/color_constants.dart';
import 'package:donateplasma/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:donateplasma/screens/productbox.dart';

import 'edit_profile.dart';

class Faq extends StatelessWidget {
  static const routeName = '/Faq';

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
              'FAQ',
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
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(EditProfile.routeName);
              },
              icon: Icon(
                Icons.pan_tool,
                size: 25,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
              name: "How much plasma will you collect from each donor? ",
              description:
                  "Donors will donate between 660 to 880 milliliters of plasma based on their weight.",
            ),
            ProductBox(
              name: "Can a recovered COVID-19 donor donate more than once?",
              description:
                  "Like normal source plasma donors, convalescent plasma donors are able to donate as frequently as twice in a seven-day period with a full day in-between donations",
            ),
            ProductBox(
              name: "Will food supplementry be provided for re-energising ?",
              description:
                  "A fruit juice and a mini meal will be provided. Complete care will be taken from the hospital management and all safety cautions and procedures will be carried out properly",
            ),
            ProductBox(
              name:
                  "Is is safe to donate plasma and will there be any side effects ?",
              description:
                  "It is totally safe to donate plasma/blood, it is also considered as heathy as new blood cells will be created",
            ),
          ],
        ));
  }
}
