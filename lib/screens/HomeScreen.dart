import 'package:donateplasma/animation/FadeAnimation.dart';
import 'package:donateplasma/constants/color_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donateplasma/providers/information.dart';
import 'package:donateplasma/providers/users.dart';
import 'package:donateplasma/widgets/drawerWidget.dart';
import 'package:donateplasma/widgets/info_card_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final information = Provider.of<Information>(context).infoList;
    // ignore: unused_local_variable
    final users = Provider.of<Users>(context).userList;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'H.O.P.E.',
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FadeAnimation(
            1.7,
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: information.length,
                  itemBuilder: (ctx, index) => InfoCardWidget(
                        color: information[index].color,
                        message: information[index].message,
                        infoId: information[index].infoId,
                      )),
            ),
          ),
          FadeAnimation(
            1.9,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                  child: Text(
                    'View Donors',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                  child: Icon(Icons.supervised_user_circle),
                ),
              ],
            ),
          ),
          Expanded(child: ListPage()),
        ],
      ),
    );
  }

  void getData() {
    final databaseReference = Firestore.instance;
    databaseReference
        .collection("users")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("users").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].data["name"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      subtitle: Text(snapshot.data[index].data["location"]),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.icons8.com/cotton/2x/contact-card.png"),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data['name']),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            home(context),
          ],
        ),
      ),
    );
  }

  Widget home(BuildContext context) {
    return new Material(
      child: new RaisedButton(
        child: const Text('Access Donor Details'),
        color: kPrimaryColor,
        elevation: 4.0,
        splashColor: Colors.amberAccent,
        textColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
          // Perform some action
        },
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('DONOR DETAILS'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text:
            "The donor details are viewed under authenticated discretion only to the medical authorities with the access provision\n\n",
        style: const TextStyle(color: Colors.deepOrangeAccent),
        children: <TextSpan>[
          const TextSpan(text: 'Name:\t\t'),
          new TextSpan(
            text: widget.post.data['name'],
          ),
          new TextSpan(
            text: "\n\n",
          ),
          const TextSpan(text: 'Blood Group:\t'),
          new TextSpan(
            text: widget.post.data['bloodgroup'],
          ),
          new TextSpan(
            text: "\n\n",
          ),
          const TextSpan(text: 'Location:\t'),
          new TextSpan(
            text: widget.post.data['location'],
          ),
          new TextSpan(
            text: "\n\n",
          ),
          const TextSpan(text: 'Phone Number:\t'),
          new TextSpan(
            text: widget.post.data['phonenumber'],
          ),
        ],
      ),
    );
  }
}
