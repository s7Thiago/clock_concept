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

  @override
  void initState() {
    super.initState();

    pageControllerDezenaHora = PageController(viewportFraction: 0.05);
    pageControllerUnidadeHora = PageController(viewportFraction: 0.05);
    pageControllerDezenaMinuto = PageController(viewportFraction: 0.05);
    pageControllerUnidadeMinuto = PageController(viewportFraction: 0.05);
    pageControllerDezenaSegundo = PageController(viewportFraction: 0.05);
    pageControllerUnidadeSegundo = PageController(viewportFraction: 0.05);

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    //debugPrint('agora: $now');

    // pageControllerUnidadeSegundo.animateToPage(
    //   2,
    //   duration: const Duration(milliseconds: 350),
    //   curve: Curves.easeInOutQuad,
    // );

    return Container(
      //color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width * .93,
      height: MediaQuery.of(context).size.height * .87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
