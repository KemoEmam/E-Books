import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController slidingController;
  late AnimationController fadeController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigationToHome();
  }

  @override
  void dispose() {
    slidingController.dispose();
    fadeController.dispose();
    resetSystemUI();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeTransition(
            opacity: fadeController,
            child: SvgPicture.asset(
              AssetsData.logo,
              width: 250,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingAnimation,
                  child: const Text(
                    'Read with enjoy',
                    style: Styles.textStyle14,
                    textAlign: TextAlign.center,
                  ),
                );
              })
        ]);
  }

  void initAnimation() {
    // SlidingAnimation
    slidingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    slidingAnimation = Tween(begin: const Offset(0, 7), end: Offset.zero)
        .animate(slidingController);
    slidingController.forward();
// FadeAnimation
    fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3200));
    fadeController.forward();
// SystemUiOverlay
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void resetSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void navigationToHome() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          // statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.light,
        ),
      );
      GoRouter.of(context).push(AppRoutes.homeRoute);
    });
  }
}
