import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motivational_clock/constants/theme_data.dart';
import 'package:motivational_clock/data.dart';
import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/menu_info_model.dart';
import 'package:motivational_clock/views/clock_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);
    // vai aparecer o dia da semana, o dia e o mes
    String formattedDate = DateFormat('EEE, d MMM').format(now);

    // calculando a timezone:
    var timezone = now.timeZoneOffset.toString().split('.').first;
    print(timezone);
    var offsetSign = '';
    if (!timezone.startsWith("-")) {
      offsetSign = "+";
    }

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
                    return Container(
                      alignment: Alignment
                          .center, //esta fazendo com que o custom painter ocupe todo a tela
                      // color: Color(0xFF2D2F41),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 64,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Text(
                              "Clock",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "avenir",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontFamily: "avenir",
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "avenir",
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.center,
                              child: ClockView(
                                size: MediaQuery.of(context).size.height / 4,
                              ),
                            ),
                          ),
                          SizedBox(height: 64),
                          Flexible(
                            // flex: 2,
                            // fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Timezone",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "avenir",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "UTC " + offsetSign + timezone,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "avenir",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
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
