import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';
import 'coins_card.dart';
import 'title_card.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({super.key, required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 505,
          width: 300,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/man.png',
                  height: 412,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffE57EFF),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff422679),
                        Color(0xff9F2298),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 45),
                      const TextB(
                        'You Win!',
                        fontSize: 60,
                      ),
                      const Spacer(),
                      CoinsCard(amount: amount),
                      const SizedBox(height: 22),
                      CuperButton(
                        onPressed: () {
                          context.pop();
                          context.pop();
                          context.pop();
                        },
                        child: SvgPicture.asset('assets/continue.svg'),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Center(
                  child: TitleCard(
                    title: 'Congratulations!',
                    win: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
