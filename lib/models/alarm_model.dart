import 'package:flutter/material.dart';

class AlarmModel {
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradientColors;

  AlarmModel({
    required this.alarmDateTime,
    required this.description,
    required this.isActive,
    required this.gradientColors,
  });
}
