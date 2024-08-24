import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_route.dart';
import 'package:hack10/views/dashboard/views/historic/dashboard_historic_page.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_page.dart';




class DashboardHistoricRoute extends AppRoute {

// calls route page once, to add to the widget
GoRoute getRoute() {
  return GoRoute(
    path: routePath,
    //builder: getPage,
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
  return DashboardHistoricPage();
}


String get routePath => "/DashboardHistoric";}