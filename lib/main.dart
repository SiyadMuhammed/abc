import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:nine_stories/models/story.dart';
import 'package:nine_stories/list.dart';
import 'package:nine_stories/models/story_theme.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<StoryTheme>(
      model: StoryTheme(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67),
          accentColor: const Color(0xFF167F67),
        ),
        home:  HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Stories",
            style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
            child: new Center(child: _buildBody(context),
          ),
        )
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('stories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        List<Story> stories = [];
        if (snapshot.data.documents.isNotEmpty) {
          for(var value in snapshot.data.documents) {
            stories.add(new Story.fromSnapshot(value));
          }
        }

        return new StoryList(stories: stories);
      },
    );
  }
}
