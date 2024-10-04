import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.title,
    this.win = false,
  });

  final String title;
  final bool win;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Center(
        child: Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
            color: const Color(0xff8403df),
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: TextB(
              title,
              fontSize: win ? 16 : 30,
            ),
          ),
        ),
      ),
    );
  }
}
