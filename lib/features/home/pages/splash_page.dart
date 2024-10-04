import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';
import '../widgets/rules_dialog.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = false;
  bool splash = true;

  void load() async {
    if (mounted) {
      context.read<HomeBloc>().add(GetCoinsEvent());
    }
    await Future.delayed(Duration.zero, () {
      setState(() {
        loading = true;
      });
    });
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        splash = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                if (splash)
                  const Spacer(flex: 2)
                else
                  SizedBox(height: 48 + getStatusBar(context)),
                SvgPicture.asset('assets/logo.svg'),
                if (splash) ...[
                  const SizedBox(height: 48),
                  const TextB('Loading...', fontSize: 28),
                  const SizedBox(height: 17),
                  _Loading(loading),
                  const Spacer(),
                ],
              ],
            ),
          ),
          if (!splash) ...[
            Positioned(
              left: -55,
              bottom: -200,
              child: Image.asset(
                'assets/man.png',
                height: 810,
              ),
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
              bottom: 88 + getBottom(context),
              left: 0,
              right: 0,
              child: const _Buttons(),
            ),
          ],
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading(this.loading);

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 186,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 2,
            top: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2500),
              height: 6,
              width: loading ? 182 : 0,
              decoration: BoxDecoration(
                color: const Color(0xffFF0000),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CuperButton(
          onPressed: () {
            context.push('/level');
            // context.push('/wheel');
          },
          child: SvgPicture.asset('assets/play.svg'),
        ),
        const SizedBox(height: 16),
        CuperButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const RulesDialog(rules: false);
              },
            );
          },
          child: SvgPicture.asset('assets/shop.svg'),
        ),
        const SizedBox(height: 16),
        CuperButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const RulesDialog(rules: true);
              },
            );
          },
          child: SvgPicture.asset('assets/rules.svg'),
        ),
      ],
    );
  }
}
