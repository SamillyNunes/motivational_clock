import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/menu_info_model.dart';
import 'package:motivational_clock/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivational Clock',
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfoModel>(
        create: (context) => MenuInfoModel(
          menuType: MenyType.clock,
          title: "Relógio",
          imageSource: "assets/images/clock_icon.png",
        ),
        child: HomeView(),
      ),
    );
  }
}
