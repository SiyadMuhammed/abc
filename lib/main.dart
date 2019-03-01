import 'dart:convert';
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
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/stories.json'),
                builder: (context, snapshot) {
                  List<Story> stories = parseJson(snapshot.data.toString());
                  return stories.isNotEmpty ? new StoryList(stories: stories)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        )
    );
  }

  List<Story> parseJson(String response) {
    if(response == null) {
      return [];
    }

    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Story>((json) => new Story.fromJson(json)).toList();
  }
}
