import 'package:flutter/material.dart';
import 'package:motivational_clock/constants/theme_data.dart';
import 'package:motivational_clock/data.dart';

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 64,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alarme",
            style: TextStyle(
              color: CustomColors.primaryTextColor,
              fontSize: 24,
              fontFamily: "avenir",
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map(
                (alarm) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      // height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: alarm.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: alarm.gradientColors.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.label,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    alarm.description,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "avenir",
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: true,
                                onChanged: (value) {},
                                activeColor: Colors.white,
                              ),
                            ],
                          ),
                          Text(
                            "Mon-Fri",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "avenir",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${alarm.alarmDateTime.hour}:${alarm.alarmDateTime.minute}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 36,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
