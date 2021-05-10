import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/menu_info_model.dart';

List<MenuInfoModel> menuItems = [
  MenuInfoModel(
    menuType: MenyType.clock,
    title: "Relógio",
    imageSource: "assets/images/clock_icon.png",
  ),
  MenuInfoModel(
    menuType: MenyType.alarm,
    title: "Alarme",
    imageSource: "assets/images/alarm_icon.png",
  ),
  MenuInfoModel(
    menuType: MenyType.timer,
    title: "Timer",
    imageSource: "assets/images/timer_icon.png",
  ),
  MenuInfoModel(
    menuType: MenyType.stopwatch,
    title: "Cronômetro",
    imageSource: "assets/images/stopwatch_icon.png",
  ),
];
