import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    required this.price,
  });

  final int level;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CuperButton(
          onPressed: coins <= price
              ? null
              : () {
                  context.push('/onboard', extra: level);
                },
          child: Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFF730E),
                  Color(0xffC03900),
                  Color(0xffDBFF00),
                  Color(0xffCE7C00),
                ],
              ),
              boxShadow: [
                if (coins >= price) ...[
                  const BoxShadow(
                    color: Color(0xff651260),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                  const BoxShadow(
                    color: Color(0xff651260),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ],
            ),
            child: Container(
              height: 68,
              width: 68,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xff6A007D),
                    Color(0xffA100B0),
                    Color(0xffF47AFF),
                    Color(0xffA202B0),
                    Color(0xffC57AFF),
                  ],
                ),
              ),
              child: Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff9500af),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextB(
                      level.toString(),
                      fontSize: coins >= price ? 48 : 32,
                    ),
                    if (coins < price)
                      SvgPicture.asset(
                        'assets/lock.svg',
                        height: 24,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (coins < price)
          SizedBox(
            height: 24,
            width: 72,
            child: Stack(
              children: [
                SvgPicture.asset('assets/level_price.svg'),
                Positioned(
                  left: 6,
                  top: 4,
                  child: SvgPicture.asset('assets/coin.svg'),
                ),
                Positioned(
                  left: 26,
                  top: 3,
                  child: TextB(price.toString(), fontSize: 14),
                ),
              ],
            ),
          )
        else
          const SizedBox(height: 24)
      ],
    );
  }
}
