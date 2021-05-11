import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:motivational_clock/enums/enums.dart';
import 'package:motivational_clock/models/menu_info_model.dart';
import 'package:motivational_clock/views/home/home_page.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettinsAndroid =
      AndroidInitializationSettings('clock_icon');

  var initializationSettings =
      InitializationSettings(android: initializationSettinsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String? payload) async {
      if (payload != null) {
        debugPrint("notification payload: " + payload);
      }
    },
  );

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
          menuType: MenuType.clock,
          title: "Relógio",
          imageSource: "assets/images/clock_icon.png",
        ),
        child: HomeView(),
      ),
    );
  }
}
