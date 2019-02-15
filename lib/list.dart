import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:nine_stories/story_page.dart';
import 'package:nine_stories/models/story.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;

  StoryList({Key key, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: stories == null ? 0 : stories.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
                child: new GestureDetector(
                  child: new Container(
                    color: new Color(0xFFE9EABB),
                    child: new Center(
                        child: new Column(
                          // Stretch the cards in horizontal axis
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text(
                              // Read the name field value and set it in the Text widget
                              stories[index].title,
                              // set some style to text
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                            new Text(
                              // Read the name field value and set it in the Text widget
                              stories[index].summary,
                              // set some style to text
                              style: new TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ],
                        )),
                    padding: const EdgeInsets.all(15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoryPage(story: stories[index])),
                    );
                  },
                )
            );
        });
  }
}