import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int bgID = 1;
int coins = 0;
int seconds = 30;
bool bought2 = false;
bool bought3 = false;
bool bought4 = false;
bool bought5 = false;
bool secbought5 = false;
bool secbought10 = false;
bool secbought15 = false;
bool secbought20 = false;
bool secbought25 = false;

Future<void> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove(Prefs.onboard);
    // await prefs.clear();
    bgID = prefs.getInt('bgID') ?? 1;
    coins = prefs.getInt('coins') ?? 0;
    seconds = prefs.getInt('seconds') ?? 30;
    bought2 = prefs.getBool('bought2') ?? false;
    bought3 = prefs.getBool('bought3') ?? false;
    bought4 = prefs.getBool('bought4') ?? false;
    bought5 = prefs.getBool('bought5') ?? false;
    secbought5 = prefs.getBool('secbought5') ?? false;
    secbought10 = prefs.getBool('secbought10') ?? false;
    secbought15 = prefs.getBool('secbought15') ?? false;
    secbought20 = prefs.getBool('secbought20') ?? false;
    secbought25 = prefs.getBool('secbought25') ?? false;
    logger('BG ID = $bgID');
    logger('COINS = $coins');
  } catch (e) {
    logger(e);
  }
}

Future<void> addCoins(int value) async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins + value;
  prefs.setInt('coins', coins);
}

Future<void> removeCoins(int value) async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins - value;
  prefs.setInt('coins', coins);
}

Future<void> addSeconds(int value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value == 5) {
    secbought5 = true;
    prefs.setBool('secbought5', secbought5);
  } else if (value == 10) {
    secbought10 = true;
    prefs.setBool('secbought10', secbought10);
  } else if (value == 15) {
    secbought15 = true;
    prefs.setBool('secbought15', secbought15);
  } else if (value == 20) {
    secbought20 = true;
    prefs.setBool('secbought20', secbought20);
  } else if (value == 25) {
    secbought25 = true;
    prefs.setBool('secbought25', secbought25);
  }
  seconds = seconds + value;
  prefs.setInt('seconds', seconds);
}

Future<void> buyBG(int price) async {
  final prefs = await SharedPreferences.getInstance();
  await removeCoins(price);
  if (price == 300) {
    bought2 = true;
    prefs.setBool('bought2', bought2);
  } else if (price == 350) {
    bought3 = true;
    prefs.setBool('bought3', bought3);
  } else if (price == 400) {
    bought4 = true;
    prefs.setBool('bought4', bought4);
  } else if (price == 500) {
    bought5 = true;
    prefs.setBool('bought5', bought5);
  }
  await selectBG(price);
}

Future<void> selectBG(int price) async {
  final prefs = await SharedPreferences.getInstance();
  if (price == 300) bgID = 2;
  if (price == 350) bgID = 3;
  if (price == 400) bgID = 4;
  if (price == 500) bgID = 5;
  prefs.setInt('bgID', bgID);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/bg.png',
    'assets/man.png',
    'assets/bg1.png',
    'assets/bg2.jpg',
    'assets/bg3.jpg',
    'assets/bg4.jpg',
    'assets/bg5.jpg',
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}
