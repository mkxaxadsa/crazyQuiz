import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/models/quiz.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.id,
    required this.answer,
    required this.onPressed,
  });

  final String id;
  final Answer answer;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        onPressed(answer);
      },
      child: SizedBox(
        height: 74,
        width: 325,
        child: Stack(
          children: [
            if (answer.green) ...[
              SvgPicture.asset('assets/answer_card1.svg'),
            ] else if (answer.red) ...[
              SvgPicture.asset('assets/answer_card2.svg'),
            ] else ...[
              SvgPicture.asset('assets/answer_card.svg'),
            ],
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Row(
                children: [
                  const SizedBox(width: 34),
                  TextB(
                    '$id.',
                    fontSize: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextM(
                      answer.answer,
                      fontSize: 16,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
