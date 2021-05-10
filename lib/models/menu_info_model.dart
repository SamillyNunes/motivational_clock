import 'package:flutter/material.dart';
import 'package:motivational_clock/enums/enums.dart';

class MenuInfoModel extends ChangeNotifier {
  MenyType menuType;
  String title;
  String imageSource;

  MenuInfoModel({
    required this.menuType,
    required this.title,
    required this.imageSource,
  });

  updateMenu(MenuInfoModel menuInfoModel) {
    this.menuType = menuInfoModel.menuType;
    this.title = menuInfoModel.title;
    this.imageSource = menuInfoModel.imageSource;

    notifyListeners(); // para sempre atualizar o provider
  }
}
