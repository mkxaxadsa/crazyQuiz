import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/quiz_count_card.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key, required this.level});

  final int level;

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int pageIndex = 1;

  void onSkip() {
    context.replace('/quiz', extra: widget.level);
  }

  void onNext() {
    setState(() {
      if (pageIndex == 3) {
        context.replace('/quiz', extra: widget.level);
      } else {
        pageIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: GestureDetector(
        child: Stack(
          children: [
            const Center(),
            Positioned(
              left: 0,
              right: 0,
              top: 53 + getBottom(context),
              child: Center(
                child: QuizCountCard(
                  count: pageIndex,
                  onboard: true,
                ),
              ),
            ),
            Positioned(
              left: -55,
              bottom: -200,
              child: Image.asset(
                'assets/man.png',
                height: 810,
              ),
            ),
            Positioned(
              left: 150,
              bottom: 575 - getBottom(context),
              child: SvgPicture.asset('assets/onboard$pageIndex.svg'),
            ),
            Positioned(
              left: 0,
              bottom: -222,
              child: Container(
                height: 444,
                width: 444,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff661261),
                      blurRadius: 86,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 88,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CuperButton(
                    onPressed: onSkip,
                    child: SvgPicture.asset('assets/skip.svg'),
                  ),
                  const SizedBox(width: 8),
                  CuperButton(
                    onPressed: onNext,
                    child: SvgPicture.asset('assets/next.svg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
