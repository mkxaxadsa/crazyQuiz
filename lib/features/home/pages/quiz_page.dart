import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/answer_card.dart';
import '../widgets/coins_card.dart';
import '../widgets/quiz_count_card.dart';
import '../widgets/quiz_end_dialog.dart';
import '../widgets/title_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.level});

  final int level;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correctCount = 0;
  bool error = false;
  bool correct = false;
  bool canTap = true;

  late int secc;
  Timer? _timer;

  String formatTime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    return '$formattedHours:$formattedMinutes';
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secc > 0) {
        setState(() {
          secc--;
        });
      } else {
        if (index == 19) {
          _timer?.cancel();
          showDialog(
            context: context,
            builder: (context) {
              return const QuizEndDialog(
                win: false,
              );
            },
          );
        } else {
          index++;
          onTimerEnd();
        }
      }
    });
  }

  void onTimerEnd() {
    _timer?.cancel();
    setState(() {
      secc = seconds;
    });
    startTimer();
  }

  void onAnswer(Answer answer) {
    if (!canTap) return;
    onTimerEnd();
    if (answer.correct) {
      correct = true;
      answer.green = true;
      correctCount++;
    } else {
      error = true;
      answer.red = true;
    }
    canTap = false;
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      canTap = true;
      answer.green = false;
      answer.red = false;
      if (index == 19) {
        _timer?.cancel();
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) {
              return QuizEndDialog(win: correctCount == 20);
            },
          );
        }
      } else {
        index++;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    for (Quiz quiz in quizList) {
      quiz.answers.shuffle();
    }
    secc = seconds;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    logger('DISPOSE TIMER');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 50 + getStatusBar(context)),
          Row(
            children: [
              const SizedBox(width: 34),
              const ArrowBackButton(),
              const SizedBox(width: 30),
              const Spacer(),
              QuizCountCard(count: index + 1),
              const Spacer(),
              const CoinsCard(),
              const SizedBox(width: 34),
            ],
          ),
          const Spacer(),
          TitleCard(title: 'Level ${widget.level}'),
          const Spacer(),
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                Center(child: SvgPicture.asset('assets/timer_card.svg')),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      formatTime(secc),
                      style: const TextStyle(
                        color: Color(0xff370132),
                        fontSize: 16,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 290,
                      child: TextR(
                        quizList[index].question,
                        fontSize: 20,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          AnswerCard(
            id: 'A',
            answer: quizList[index].answers[0],
            onPressed: onAnswer,
          ),
          const Spacer(),
          AnswerCard(
            id: 'B',
            answer: quizList[index].answers[1],
            onPressed: onAnswer,
          ),
          const Spacer(),
          AnswerCard(
            id: 'C',
            answer: quizList[index].answers[2],
            onPressed: onAnswer,
          ),
          const Spacer(),
          AnswerCard(
            id: 'D',
            answer: quizList[index].answers[3],
            onPressed: onAnswer,
          ),
          SizedBox(height: 22 + getBottom(context)),
        ],
      ),
    );
  }
}
