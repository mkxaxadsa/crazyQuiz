import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_stroke.dart';
import '../bloc/home_bloc.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({
    super.key,
    this.amount = 0,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 32,
      child: Stack(
        children: [
          SvgPicture.asset('assets/coins.svg'),
          Positioned(
            right: 10,
            top: 7,
            bottom: 7,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is CoinsLoadedState) {
                  return TextStroke(
                    amount == 0 ? state.coins.toString() : amount.toString(),
                    strokeWidth: 2,
                    fontSize: 14,
                    fontFamily: Fonts.bold,
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
