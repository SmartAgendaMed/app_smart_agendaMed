import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_route.dart';
import 'package:hack10/views/login/login_page.dart';


class LoginRoute extends AppRoute {

  // calls route page once, to add to the widget
  GoRoute getRoute() {
    return GoRoute(
      path: routePath,
      builder: getPage,
    );
  }

  Widget getPage(BuildContext context, GoRouterState state) {
    return LoginPage();
  }


  String get routePath => "/Login";
}