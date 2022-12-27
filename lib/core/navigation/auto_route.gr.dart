// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:kodjaz/features/app/presentation/navigation_page.dart' as _i2;
import 'package:kodjaz/features/splash_screen/splash_screen_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreenPage(),
      );
    },
    NavigationRoute.name: (routeData) {
      final args = routeData.argsAs<NavigationRouteArgs>(
          orElse: () => const NavigationRouteArgs());
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.NavigationPage(key: args.key),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          NavigationRoute.name,
          path: '/navigation-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.NavigationPage]
class NavigationRoute extends _i3.PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({_i4.Key? key})
      : super(
          NavigationRoute.name,
          path: '/navigation-page',
          args: NavigationRouteArgs(key: key),
        );

  static const String name = 'NavigationRoute';
}

class NavigationRouteArgs {
  const NavigationRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'NavigationRouteArgs{key: $key}';
  }
}
