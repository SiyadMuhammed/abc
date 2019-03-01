import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class StoryTheme extends Model {
  double _fontFactor = 1;
  Color _boardColor = Colors.white;
  Color _textColor = Colors.black;

  double get fontFactor => _fontFactor;
  Color get boardColor => _boardColor;
  Color get textColor => _textColor;

  void setFontFactor(double fontFactor) {
    this._fontFactor = fontFactor;
    notifyListeners();
  }

  void setBoardColor(Color boardColor) {
    this._boardColor = boardColor;
    notifyListeners();
  }

  void setTextColor(Color textColor) {
    this._textColor = textColor;
    notifyListeners();
  }
}