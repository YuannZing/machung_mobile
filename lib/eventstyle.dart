import 'package:flutter/material.dart';

enum CalendarView {
  day,
  week,
  month,
}


class EventStyle {
  final Color color;
  final Color textColor;

  EventStyle({
    required this.color,
    required this.textColor,
  });
}
