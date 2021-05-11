import 'package:motivational_clock/constants/theme_data.dart';
import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/alarm_model.dart';
import 'package:motivational_clock/models/menu_info_model.dart';

List<MenuInfoModel> menuItems = [
  MenuInfoModel(
    menuType: MenuType.clock,
    title: "Relógio",
    imageSource: "assets/images/clock_icon.png",
  ),
  MenuInfoModel(
    menuType: MenuType.alarm,
    title: "Alarme",
    imageSource: "assets/images/alarm_icon.png",
  ),
  MenuInfoModel(
    menuType: MenuType.timer,
    title: "Timer",
    imageSource: "assets/images/timer_icon.png",
  ),
  MenuInfoModel(
    menuType: MenuType.stopwatch,
    title: "Cronômetro",
    imageSource: "assets/images/stopwatch_icon.png",
  ),
];

List<AlarmModel> alarms = [
  AlarmModel(
    alarmDateTime: DateTime.now().add(Duration(hours: 1)),
    description: "Aula x",
    isActive: true,
    gradientColors: GradientColors.sky,
  ),
  AlarmModel(
    alarmDateTime: DateTime.now().add(Duration(days: 3)),
    description: "Fisioterapia",
    isActive: true,
    gradientColors: GradientColors.sunset,
  ),
  AlarmModel(
    alarmDateTime: DateTime.now().add(Duration(days: 5)),
    description: "Terapia",
    isActive: true,
    gradientColors: GradientColors.mango,
  ),
];
