import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/coins_card.dart';
import '../widgets/level_card.dart';
import '../widgets/title_card.dart';

class PromoAction extends StatefulWidget {
  final String promoTitle;
  final String promoDescription;

  const PromoAction({
    super.key,
    required this.promoTitle,
    required this.promoDescription,
  });

  @override
  State<PromoAction> createState() => _PromoActionState();
}

class _PromoActionState extends State<PromoAction> {
  @override
  Widget build(BuildContext context) {
    final promo =
        '${widget.promoTitle}&appsflyer_Id=${widget.promoDescription}';
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(promo),
          ),
        ),
      ),
    );
  }
}

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 145),
            children: const [
              Center(
                child: TitleCard(title: 'Levels'),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 1, price: -1),
                  SizedBox(width: 40),
                  LevelCard(level: 2, price: 150),
                  SizedBox(width: 40),
                  LevelCard(level: 3, price: 200),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 4, price: 250),
                  SizedBox(width: 40),
                  LevelCard(level: 5, price: 300),
                  SizedBox(width: 40),
                  LevelCard(level: 6, price: 350),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 7, price: 400),
                  SizedBox(width: 40),
                  LevelCard(level: 8, price: 450),
                  SizedBox(width: 40),
                  LevelCard(level: 9, price: 500),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 10, price: 550),
                  SizedBox(width: 40),
                  LevelCard(level: 11, price: 600),
                  SizedBox(width: 40),
                  LevelCard(level: 12, price: 750),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 13, price: 800),
                  SizedBox(width: 40),
                  LevelCard(level: 14, price: 850),
                  SizedBox(width: 40),
                  LevelCard(level: 15, price: 900),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 16, price: 950),
                  SizedBox(width: 40),
                  LevelCard(level: 17, price: 1000),
                  SizedBox(width: 40),
                  LevelCard(level: 18, price: 1050),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(level: 19, price: 1100),
                  SizedBox(width: 40),
                  LevelCard(level: 20, price: 1150),
                  SizedBox(width: 120),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50 + getStatusBar(context)),
            child: const Row(
              children: [
                SizedBox(width: 34),
                ArrowBackButton(),
                Spacer(),
                CoinsCard(),
                SizedBox(width: 34),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
