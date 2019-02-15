import 'package:flutter/material.dart';

import 'package:nine_stories/models/story.dart';


class StoryPage extends StatelessWidget {
  final Story story;

  StoryPage({this.story});

  Widget _buildImageWidget(String image) {
    if (image.isNotEmpty) {
      return Image.asset(image);
    }
    return SizedBox();
  }

  Widget _buildStoryBoard (Story story) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 12),
              child: Text(
                story.title,
                style: new TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
            ),
            _buildImageWidget(story.image),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: Text(
                story.body,
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget materialPage = Scaffold(
        body: _buildStoryBoard(story)
    );

    return materialPage;
  }
}