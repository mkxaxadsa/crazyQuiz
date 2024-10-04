import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'cuper_button.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        context.pop();
      },
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: const Color(0xff8403df),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/arrow.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
