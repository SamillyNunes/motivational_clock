import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motivational_clock/constants/theme_data.dart';
import 'package:motivational_clock/data.dart';
import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/menu_info_model.dart';
import 'package:motivational_clock/views/clock/clock_page.dart';
import 'package:motivational_clock/views/clock/clock_painting.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map(
                  (menuItem) => menuButton(menuItem),
                )
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfoModel>(
              builder: (context, value, child) {
                switch (value.menuType) {
                  case MenyType.clock:
                    return ClockPage();
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menuButton(MenuInfoModel currentMenuInfo) {
    // consumer -> consome o valor de um provider
    return Consumer<MenuInfoModel>(
      builder: (context, MenuInfoModel value, child) {
        return TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16)),
              backgroundColor: currentMenuInfo.menuType == value.menuType
                  ? MaterialStateProperty.all(CustomColors.menuBackgroundColor)
                  : MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(32))),
              )),
          onPressed: () {
            MenuInfoModel menuInfo =
                Provider.of<MenuInfoModel>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "avenir",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
