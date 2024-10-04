import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';
import 'coins_card.dart';
import 'title_card.dart';

class QuizEndDialog extends StatelessWidget {
  const QuizEndDialog({super.key, required this.win});

  final bool win;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 540,
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
                  margin: const EdgeInsets.only(bottom: 35),
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
                      // const SizedBox(height: 30),
                      const Spacer(),
                      TextB(
                        win
                            ? 'You have successfully completed all tasks of this test'
                            : 'Unfortunately, you were unable to pass this test. Try again',
                        fontSize: 26,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      if (win) const CoinsCard(amount: 150),
                      const Spacer(),
                      CuperButton(
                        onPressed: () async {
                          if (win) {
                            await addCoins(150).then((_) {
                              if (context.mounted) {
                                context.read<HomeBloc>().add(GetCoinsEvent());
                                context.pop();
                                context.push('/wheel');
                              }
                            });
                          } else {
                            context.pop();
                            context.pop();
                          }
                        },
                        child: SvgPicture.asset(
                            win ? 'assets/continue.svg' : 'assets/again.svg'),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Center(
                  child: TitleCard(
                    title: win ? 'Congratulations!' : 'Game Over!',
                    win: true,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CuperButton(
                  onPressed: () async {
                    await addCoins(150).then((_) {
                      if (context.mounted) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                        context.pop();
                        context.pop();
                        context.pop();
                      }
                    });
                  },
                  child: SvgPicture.asset('assets/menu.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
