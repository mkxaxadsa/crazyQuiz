import 'package:go_router/go_router.dart';

import '../../features/home/pages/level_page.dart';
import '../../features/home/pages/onboard_page.dart';
import '../../features/home/pages/quiz_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../../features/home/pages/wheel_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => OnboardPage(
        level: state.extra as int,
      ),
    ),
    GoRoute(
      path: '/level',
      builder: (context, state) => const LevelPage(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => QuizPage(
        level: state.extra as int,
      ),
    ),
    GoRoute(
      path: '/wheel',
      builder: (context, state) => const WheelPage(),
    ),
  ],
);
