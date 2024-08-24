

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_route.dart';

class RouterConfiguration {
  final String initialRoute;
  final String? loggedInRoute;
  final List<AppRoute> Function(GlobalKey<NavigatorState> rootNavigator) getModuleRoutes;
  final AppRoute? testRoute;
  RouterConfiguration({required this.initialRoute, required this.getModuleRoutes,
    this.testRoute,
  this.loggedInRoute,});

}

// GoRouter configuration for system routes
Future<GoRouter> getAppRouter({required RouterConfiguration configuration,
bool checkNavigationsForLoggedIn=false}) async {
  GlobalKey<NavigatorState> rootNavigator = GlobalKey();

  List<AppRoute> moduleRoutes = configuration.getModuleRoutes(rootNavigator);

  if(configuration.testRoute != null) {
    if(!moduleRoutes.contains(configuration.testRoute)) {
      moduleRoutes.add(configuration.testRoute!);
    }
  }
  List<RouteBase> routes = [
    for (AppRoute route in moduleRoutes) route.getRoute(),
  ];

  List routesBeforeLogged = moduleRoutes.where(
          (element) => element.needsToBeLogged == false
  ).toList();

  String? initialLocation = await _loadInitialLocation(configuration);
  debugPrint("initial route: ${initialLocation}");

  return GoRouter(
    initialLocation: initialLocation,
    navigatorKey: rootNavigator,
    redirect: checkNavigationsForLoggedIn ? (context, state) async {

      debugPrint("state uro: ${state.uri}");
      //debugPrint("state name: ${state.name}");
      //debugPrint("state uri: ${state.uri}");
      /*if(await sl.get<UserSessionRepository>().hasActiveSession()) {
        debugPrint("has active session");
        return null;
      }*/
      for (AppRoute route in routesBeforeLogged) {
        if(route.routePath == state.uri.path) {
          return null;
        }
      }
      if (routesBeforeLogged.any((element) =>
      element.routePath == state.uri.path) == false) {
        return "/login";
      }
    } : null,
    routes: routes,
  );
}

Future<String?> _loadInitialLocation(RouterConfiguration configuration) async {


  if(configuration.testRoute != null) {
    return configuration.testRoute!.routePath;
  }
  String? initialLocation =
  configuration.initialRoute;

  if(configuration.loggedInRoute != null) {
    /*bool hasActiveSession = await  sl.get<UserSessionRepository>().hasActiveSession();

    if(hasActiveSession) {
      initialLocation = configuration.loggedInRoute;
    }*/
  }
  return initialLocation;
}
