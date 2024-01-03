import 'package:deeplinking_demo/models/models.dart';
import 'package:deeplinking_demo/ui/home_view.dart';
import 'package:deeplinking_demo/ui/splash_screen_view.dart';
import 'package:deeplinking_demo/ui/ui.dart';
import 'package:flutter/material.dart';

import 'route_paths.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable

    T? extractArguments<T>(RouteSettings settings) {
      return settings.arguments as T?;
    }

// Usage
    // ignore: unused_local_variable
    var routeArgs = extractArguments(settings);

    switch (settings.name) {
      case (RoutePaths.SPLASH_SCREEN):
        return _getPageRoute(
            settings: settings, viewToShow: const SplashScreenView());
      case (RoutePaths.HOME):
        return _getPageRoute(settings: settings, viewToShow: const HomeView());
      case (RoutePaths.DEEP_LINK_ENTRY):
        final data = routeArgs?['data'] as DeepLinkData;
        return _getPageRoute(
            settings: settings,
            viewToShow: DeepLinkEntryView(
              data: data,
            ));
      case (RoutePaths.DETAILS):
        return _getPageRoute(
            settings: settings, viewToShow: const DetailsView());

      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: Scaffold(
            body: Center(
              child: Text("No page specified for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
