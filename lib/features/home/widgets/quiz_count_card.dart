import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class QuizCountCard extends StatelessWidget {
  const QuizCountCard({
    super.key,
    required this.count,
    this.onboard = false,
  });

  final int count;
  final bool onboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Container(
          height: 38,
          width: 84,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: TextM(
              onboard ? '$count/3' : '$count/20',
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
