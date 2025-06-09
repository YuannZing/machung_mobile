import 'package:flutter/material.dart';


class EventModel {
  final String id;
  final String title;
  final Widget description;
  final String date;
  final String time;
  final bool isAllDay;
  final String location;
  final EventStyle style;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isAllDay,
    required this.location,
    required this.style,
  });
}

class EventStyle {
  final Color color;
  final Color textColor;

  EventStyle({required this.color, required this.textColor});
}

class HolidayModel {
  final String name;
  final String date;

  HolidayModel({required this.name, required this.date});
}
