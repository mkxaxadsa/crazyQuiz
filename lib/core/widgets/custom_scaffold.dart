import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.splash = false,
  });

  final Widget body;
  final bool splash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                if (splash)
                  Image.asset(
                    'assets/bg.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                else
                  Image.asset(
                    bgID == 1 ? 'assets/bg$bgID.png' : 'assets/bg$bgID.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                if (!splash)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
