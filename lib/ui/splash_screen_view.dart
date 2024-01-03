import 'package:deeplinking_demo/core/core.dart';
import 'package:deeplinking_demo/router/router.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    _onInit();
  }

  _onInit() {
    //TODO: handle cases where the user is authenticated, onboarding not activated, ...
    DeepLinkService.instance.initializeAppLinks();
    NavigationService.instance.navigateToReplaceAll(RoutePaths.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "DeepLinks Demo",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
