import 'package:flutter/material.dart';

class Story {
  final String title;
  final String summary;
  final String body;
  final String image;

  Story({
    @required this.title,
    @required this.summary,
    @required this.body,
    this.image
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return new Story(
      title: json['title'] as String,
      summary: json['summary'] as String,
      body: json['story'] as String,
      image: json['image'] as String,
    );
  }
}