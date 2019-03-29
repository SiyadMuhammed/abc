import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:nine_stories/models/story.dart';
import 'package:nine_stories/models/story_theme.dart';

class StoryPage extends StatefulWidget {
  final Story story;

  StoryPage({this.story});

  @override
  _StoryPage createState() => _StoryPage();
}

class _StoryPage extends State<StoryPage> {
  Widget _buildImageWidget(String image) {
    if (image.isNotEmpty) {
      return Image.network(image);
    }
    return SizedBox();
  }

  Widget _buildStoryBoard(Story story) {
    return ScopedModelDescendant<StoryTheme>(
        builder: (context, child, model) => Container(
              decoration: new BoxDecoration(color: model.boardColor),
              child: new SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 12),
                      child: Text(
                        story.title,
                        style: new TextStyle(
                          fontSize: 22.0 * model.fontFactor,
                          color: model.textColor,
                        ),
                      ),
                    ),
                    _buildImageWidget(story.image),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
                      child: Text(
                        story.body,
                        style: new TextStyle(
                          fontSize: 16.0 * model.fontFactor,
                          color: model.textColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget _buildThemeButtons() {
    return ScopedModelDescendant<StoryTheme>(
        builder: (context, child, model) => Row(
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    model.setBoardColor(Colors.black);
                    model.setTextColor(Colors.white);
                  },
                  child: (model.boardColor == Colors.black) ? Icon(Icons.check) : null
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    model.setBoardColor(Colors.white);
                    model.setTextColor(Colors.black);
                  },
                  child: (model.boardColor == Colors.white) ? Icon(Icons.check) : null,
                  foregroundColor: Colors.black,
                ),
                FloatingActionButton(
                  backgroundColor: Color(0XFFFFFEEE),
                  onPressed: () {
                    model.setBoardColor(Color(0XFFFFFEEE));
                    model.setTextColor(Colors.black);
                  },
                  child: (model.boardColor == Color(0XFFFFFEEE)) ? Icon(Icons.check) : null,
                  foregroundColor: Colors.black,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ));
  }

  Widget _buildFontSizeSlider() {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Row(
          children: <Widget>[
            Text(
              "a",
              style: new TextStyle(fontSize: 15),
            ),
            Expanded(
              child: new ScopedModelDescendant<StoryTheme>(
                builder: (context, child, model) => Slider(
                      activeColor: Color(0xFF167F67),
                      min: 1.0,
                      max: 1.3,
                      onChanged: (newValue) {
                        model.setFontFactor(newValue);
                      },
                      value: model.fontFactor,
                    ),
              ),
            ),
            Text(
              "a",
              style: new TextStyle(fontSize: 25),
            ),
          ],
        ));
  }

  Widget _buildBottomModal() {
    Widget modalBody = Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_buildThemeButtons(), _buildFontSizeSlider()],
      ),
    );

    return modalBody;
  }

  @override
  Widget build(BuildContext context) {
    Widget materialPage = Scaffold(
        body: GestureDetector(
            child: _buildStoryBoard(widget.story),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomModal();
                  });
            }));

    return materialPage;
  }
}
