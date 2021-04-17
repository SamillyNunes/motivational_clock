import 'package:flutter/material.dart';
import 'package:motivational_clock/views/clock_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment
            .center, //esta fazendo com que o custom painter ocupe todo a tela
        color: Color(0xFF2D2F41),
        child: ClockView(),
      ),
    );
  }
}
