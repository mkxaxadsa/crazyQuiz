import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
    required this.price,
    this.bg = 0,
    this.sec = 0,
    this.bought = false,
    this.selected = false,
  });

  final int price;
  final int bg;
  final int sec;
  final bool bought;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            CuperButton(
              onPressed: () async {
                if (bought) {
                  if (bg != 0) selectBG(price);
                } else {
                  if (coins >= price) {
                    if (sec != 0) {
                      await removeCoins(price);
                      await addSeconds(sec);
                    } else if (bg != 0) {
                      await buyBG(price);
                    }
                  }
                }
                if (context.mounted) {
                  context.read<HomeBloc>().add(GetCoinsEvent());
                }
              },
              child: SizedBox(
                height: 85,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/shop_item.svg'),
                    if (bg > 1) ...[
                      Positioned(
                        top: 7.5,
                        left: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.asset(
                            'assets/bg$bg.jpg',
                            height: 66,
                            width: 66,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    if (sec >= 5) ...[
                      Positioned(
                        top: 20,
                        left: 24,
                        child: TextB(
                          '+ $sec\nsec',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (!bought) ...[
              const SizedBox(height: 1),
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
              ),
            ] else if (selected)
              const SizedBox(
                height: 25,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.greenAccent,
                ),
              )
            else
              const SizedBox(height: 25),
          ],
        );
      },
    );
  }
}
