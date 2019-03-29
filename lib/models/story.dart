import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Story.fromSnapshot(DocumentSnapshot snapshot) {
    return new Story(
      title: snapshot['title'] as String,
      summary: snapshot['summary'] as String,
      body: snapshot['story'] as String,
      image: snapshot['image'] as String,
    );
  }
}