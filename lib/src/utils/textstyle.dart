import 'package:flutter/material.dart';

TextStyle textStyle({
  Color? color,
  double? size,
  FontWeight? weight,
  FontStyle? style,
  double? lSpacing,
  TextDecoration? decoration,
  double? decorationThickness,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    letterSpacing: lSpacing,
    color: color,
    fontStyle: style,
    decoration: decoration,
    decorationThickness: decorationThickness,
    overflow: overflow ?? TextOverflow.ellipsis,
  );
}
