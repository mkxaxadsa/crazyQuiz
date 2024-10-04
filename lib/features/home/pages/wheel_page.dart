import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/home_bloc.dart';
import '../widgets/coins_card.dart';
import '../widgets/win_dialog.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({super.key});

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  double turns = 0.0;
  double angle = 0;
  String asset = '';
  bool canSpin = true;

  List<double> angles = [
    1, // 5 0
    2, // 15 1
    3, // 15 2
    4, // 5 3
    5, // 50 4
    7, // 55 5
    12, // 25 6
    14, // 10 7
    15, // 150 8
    16, // 20 9
    19, // 1 10
    21, // 500 11
  ];

  int getCoins() {
    asset = '';
    if (angle == 1) return 5;
    if (angle == 2) return 15;
    if (angle == 3) return 15;
    if (angle == 4) return 5;
    if (angle == 5) return 50;
    if (angle == 7) return 55;
    if (angle == 12) return 25;
    if (angle == 14) return 10;
    if (angle == 15) return 150;
    if (angle == 16) return 20;
    if (angle == 19) return 1;
    if (angle == 21) return 500;
    return 0;
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        logger(angle);
      });
    });
  }

  void onSpin() async {
    setState(() {
      turns += 5 / 1;
      canSpin = false;
    });
    getRandom();
    await Future.delayed(const Duration(seconds: 7), () async {
      logger(getCoins());
      await addCoins(getCoins());
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.read<HomeBloc>().add(GetCoinsEvent());
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return WinDialog(
                amount: getCoins(),
              );
            },
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: Stack(
        children: [
          const Center(),
          // Positioned(
          //   left: 0,
          //   bottom: -222,
          //   child: Container(
          //     height: 444,
          //     width: 444,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color(0xff661261),
          //           blurRadius: 86,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Positioned(
            top: 126 + getStatusBar(context),
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 550,
                width: 370,
                child: Stack(
                  children: [
                    Positioned(
                      left: 50,
                      child: Image.asset(
                        'assets/man.png',
                        height: 412,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 150,
                      child: SvgPicture.asset('assets/info.svg'),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.rotate(
                        angle: angle,
                        child: AnimatedRotation(
                          turns: turns,
                          curve: Curves.easeInOutCirc,
                          duration: const Duration(seconds: 7),
                          child: SvgPicture.asset('assets/wheel.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 178,
                      child: SvgPicture.asset('assets/wheel2.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50 + getStatusBar(context)),
            child: const Row(
              children: [
                SizedBox(width: 34),
                ArrowBackButton(),
                Spacer(),
                CoinsCard(),
                SizedBox(width: 34),
              ],
            ),
          ),
          if (canSpin)
            Positioned(
              bottom: 56,
              left: 0,
              right: 0,
              child: CuperButton(
                onPressed: onSpin,
                child: SvgPicture.asset('assets/spin.svg'),
              ),
            ),
        ],
      ),
    );
  }
}
