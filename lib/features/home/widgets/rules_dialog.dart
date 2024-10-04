import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../bloc/home_bloc.dart';
import 'shop_item.dart';
import 'title_card.dart';

class RulesDialog extends StatelessWidget {
  const RulesDialog({super.key, required this.rules});

  final bool rules;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 520,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 472,
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
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (rules)
                              const Text(
                                'We invite you to complete the tests on time, answering the questions correctly in our victory and receiving valuable points and valuable prizes for this. We invite you to take part in a competition that will allow you to change your luck and receive additional prizes in our Wheel of Fortune, which will be available after everyone receives an answer.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: Fonts.medium,
                                  height: 1.5,
                                ),
                              )
                            else ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShopItem(
                                    price: 50,
                                    sec: 5,
                                    bought: secbought5,
                                  ),
                                  ShopItem(
                                    price: 100,
                                    sec: 10,
                                    bought: secbought10,
                                  ),
                                  ShopItem(
                                    price: 150,
                                    sec: 15,
                                    bought: secbought15,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShopItem(
                                    price: 200,
                                    sec: 20,
                                    bought: secbought20,
                                  ),
                                  ShopItem(
                                    price: 250,
                                    sec: 25,
                                    bought: secbought25,
                                  ),
                                  ShopItem(
                                    price: 300,
                                    bg: 2,
                                    bought: bought2,
                                    selected: bgID == 2,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShopItem(
                                    price: 350,
                                    bg: 3,
                                    bought: bought3,
                                    selected: bgID == 3,
                                  ),
                                  ShopItem(
                                    price: 400,
                                    bg: 4,
                                    bought: bought4,
                                    selected: bgID == 4,
                                  ),
                                  ShopItem(
                                    price: 500,
                                    bg: 5,
                                    bought: bought5,
                                    selected: bgID == 5,
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: TitleCard(
                  title: rules ? 'Rules' : 'Shop',
                ),
              ),
              Positioned(
                right: -5,
                top: 25,
                child: CuperButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff8403df),
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/close.svg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
