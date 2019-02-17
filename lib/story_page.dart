import 'package:flutter/material.dart';

import 'package:nine_stories/models/story.dart';


class StoryPage extends StatefulWidget {
  final Story story;

  StoryPage({this.story});

  @override
  _StoryPage createState() => _StoryPage();
}

class _StoryPage extends State<StoryPage> {

  double _fontFactor = 1;
  Color _boardColor = Colors.white;
  Color _textColor = Colors.black;
  

  Widget _buildImageWidget(String image) {
    if (image.isNotEmpty) {
      return Image.asset(image);
    }
    return SizedBox();
  }

  Widget _buildStoryBoard (Story story) {
    return Container(
      decoration: new BoxDecoration(color: _boardColor),
      child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 12),
              child: Text(
                story.title,
                style: new TextStyle(
                  fontSize: 22.0 * _fontFactor,
                  color: _textColor,
                ),
              ),
            ),
            _buildImageWidget(story.image),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: Text(
                story.body,
                style: new TextStyle(
                  fontSize: 16.0 * _fontFactor,
                  color: _textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThemeButtons() {
    return Row(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              _boardColor = Colors.black;
              _textColor = Colors.white;
            });
          },
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              _boardColor = Colors.white;
              _textColor = Colors.black;
            });
          },
        ),
        FloatingActionButton(
          backgroundColor: Color(0XFFFFFEEE),
          onPressed: () {
            setState(() {
              _boardColor = Color(0XFFFFFEEE);
              _textColor = Colors.black;
            });
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget _buildFontSizeSlider() {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Row(
          children: <Widget>[
            Text("a", style: new TextStyle(fontSize: 15),),
            Expanded(
              child: Slider(
                activeColor: Color(0xFF167F67),
                min: 1.0,
                max: 1.3,
                onChanged: (newValue) {
                  setState(() {
                    _fontFactor = newValue;
                  });
                },
                value: _fontFactor,
              ),
            ),
            Text("a", style: new TextStyle(fontSize: 25),),
          ],
        )
    );
  }

  Widget _buildBottomModal () {
    Widget modalBody = Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildThemeButtons(),
          _buildFontSizeSlider()
        ],
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
              showModalBottomSheet(context: context, builder: (BuildContext context) {
                return _buildBottomModal();
              });
            }
        )
    );

    return materialPage;
  }
}