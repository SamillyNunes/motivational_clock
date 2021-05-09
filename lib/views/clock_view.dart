import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    // aqui estamos definindo um timer periodicamente que ira rodar um codigo a cada duracao definida
    // Nesse caso, a cada um segundo ele ira atualizar toda a interface para pegar a atualizacao do relogio
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {},
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size, // analisar depois a mudanca desses numeros fixos
      child: Transform.rotate(
        //rodar a tela toda em -90 graus (pi/2). Perceba que eh menos 90 graus porque eh antihorario
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime datetime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // vai retornar qual desses dois eh o minimo, se eh a metade da largura ou a metade da altura
    double radius = min(centerX, centerY);

    Paint fillBrush = Paint()..color = Color(0xFF444974);

    Paint outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke //aqui vai dizer que sera apenas uma borda
      ..strokeWidth =
          size.width / 20; // aqui vai especificar a largura da borda

    Paint centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    Paint secondsHandBrush = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke //aqui vai dizer que sera apenas uma borda
      ..strokeCap =
          StrokeCap.round // para dizer que o formato do ponteiro eh arredondado
      ..strokeWidth =
          size.width / 60; // aqui vai especificar a largura da borda

    Paint minutesHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [
          Color(0xFF748EF6),
          Color(0xFF77DDFF),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke //aqui vai dizer que sera apenas uma borda
      ..strokeCap =
          StrokeCap.round // para dizer que o formato do ponteiro eh arredondado
      ..strokeWidth =
          size.width / 30; // aqui vai especificar a largura da borda

    Paint hourHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [
          Color(0xFFEA74AB),
          Color(0xFFC279FB),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke //aqui vai dizer que sera apenas uma borda
      ..strokeCap =
          StrokeCap.round // para dizer que o formato do ponteiro eh arredondado
      ..strokeWidth =
          size.width / 24; // aqui vai especificar a largura da borda

    Paint dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke //aqui vai dizer que sera apenas uma borda
      ..strokeCap =
          StrokeCap.round // para dizer que o formato do ponteiro eh arredondado
      ..strokeWidth = 1; // aqui vai especificar a largura da borda

    // Vai ser -40 para dar espaco para a borda e as linhas do circulo
    canvas.drawCircle(
        center, radius * 0.75, fillBrush); // circulo principal, o do fundo
    canvas.drawCircle(center, radius * 0.75, outlineBrush); // circulo da borda

    // aqui abaixo o radius*0.4 eh a distancia que eu quero o ponteiro do centro ate essa distancia
    // 12h - 360 graus, 1 hora - 30 graus, 1 minuto = 0.5 graus (porque queremos atualizar a pos por minuto)
    // o que estamos fazendo eh que, para cada minuto, quer-se que o ponteiro mova-se meio pontos na posicao
    double hourHandX = centerX +
        radius *
            0.4 *
            cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    double hourHandY = centerX +
        radius *
            0.4 *
            sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    // aqui abaixo o 80 eh a distancia que eu quero o ponteiro do centro ate essa distancia
    // 60 minutos = 360 graus, 1 minuto = 6 graus -> por isso o datetime.minute*6
    double minuteHandX =
        centerX + radius * 0.6 * cos(datetime.minute * 6 * pi / 180);
    double minuteHandY =
        centerX + radius * 0.6 * sin(datetime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minutesHandBrush);

    // aqui abaixo o 80 eh a distancia que eu quero o ponteiro do centro ate essa distancia
    // 60 segundos = 360 graus, 1 segundo = 6 graus
    double secondHandX =
        centerX + radius * 0.6 * cos(datetime.second * 6 * pi / 180);
    double secondHandY =
        centerX + radius * 0.6 * sin(datetime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondsHandBrush);

    // esse tem que ser acima dos outros objetos
    canvas.drawCircle(center, radius * 0.12,
        centerFillBrush); // circulo do meio que agrupa os ponteiros

    // desenhar os pontilhados ao redor do relogio:
    double outerCircleRadius = radius;
    double innerCircleRadius = radius * 0.9;
    for (double i = 0; i < 360; i += 12) {
      // posicao inicial
      double x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      double y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      // posicao final da linha
      double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      double y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      // desenhando cada linha
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
