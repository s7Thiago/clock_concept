import 'dart:async';

import 'package:clock_concept/widgets/clock/animated_selector.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late PageController pageControllerDezenaHora;
  late PageController pageControllerUnidadeHora;
  late PageController pageControllerDezenaMinuto;
  late PageController pageControllerUnidadeMinuto;
  late PageController pageControllerDezenaSegundo;
  late PageController pageControllerUnidadeSegundo;
  late DateTime now;

  @override
  void initState() {
    super.initState();

    const double viewportFraction = 0.05;

    pageControllerDezenaHora = PageController(viewportFraction: viewportFraction);
    pageControllerUnidadeHora = PageController(viewportFraction: viewportFraction);
    pageControllerDezenaMinuto = PageController(viewportFraction: viewportFraction);
    pageControllerUnidadeMinuto = PageController(viewportFraction: viewportFraction);
    pageControllerDezenaSegundo = PageController(viewportFraction: viewportFraction);
    pageControllerUnidadeSegundo = PageController(viewportFraction: viewportFraction);

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      now = DateTime.now();

      // Movendo cada indicador periodicamente na sua respectiva unidade
      pageControllerDezenaHora.animateToPage(
        now.hour ~/ 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      pageControllerUnidadeHora.animateToPage(
        now.hour % 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      pageControllerDezenaMinuto.animateToPage(
        now.minute ~/ 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      pageControllerUnidadeMinuto.animateToPage(
        now.minute % 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      pageControllerDezenaSegundo.animateToPage(
        now.second ~/ 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      pageControllerUnidadeSegundo.animateToPage(
        now.second % 10,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutQuad,
      );

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    now = DateTime.now();

    //debugPrint('agora: $now');

    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          // Dezena Horas
          AnimatedSelector(
            pageController: pageControllerDezenaHora,
            count: 3,
            indicatorPosition: 38 + (36 * 7) + ((now.hour ~/ 10) * 36.0),
          ),

          // Unidade Horas
          AnimatedSelector(
            pageController: pageControllerUnidadeHora,
            indicatorPosition: 38 + ((now.hour % 10) * 36.0),
          ),

          // Dezena Minutos
          AnimatedSelector(
            pageController: pageControllerDezenaMinuto,
            count: 6,
            indicatorPosition: 38 + (36 * 4) + ((now.minute ~/ 10) * 36.0),
          ),

          // Unidade Minutos
          AnimatedSelector(
            pageController: pageControllerUnidadeMinuto,
            indicatorPosition: 38 + ((now.minute % 10) * 36.0),
          ),

          // Dezena Segundos
          AnimatedSelector(
            pageController: pageControllerDezenaSegundo,
            count: 6,
            indicatorPosition: 38 + (36 * 4) + ((now.second ~/ 10) * 36.0),
          ),

          // Unidade segundos
          AnimatedSelector(
            pageController: pageControllerUnidadeSegundo,
            indicatorPosition: 38 + ((now.second % 10) * 36.0),
          ),
        ],
      ),
    );
  }
}
