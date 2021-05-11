import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motivational_clock/views/clock/clock_painting.dart';

class ClockPage extends StatelessWidget {
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
              child: ClockPainting(
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
  }
}
