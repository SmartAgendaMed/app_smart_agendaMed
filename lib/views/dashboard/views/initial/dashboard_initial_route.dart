import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_route.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_page.dart';




class DashboardInitialRoute extends AppRoute {

// calls route page once, to add to the widget
GoRoute getRoute() {
  return GoRoute(
    path: routePath,
   // builder: getPage,
    pageBuilder: (context, state) =>

        CustomTransitionPage(
          child:
          getPage(context, state),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return child;
          }
          ,),
  );
}

Widget getPage(BuildContext context, GoRouterState state) {
  return DashboardInitialPage();
}


String get routePath => "/Dashboardinitial";}