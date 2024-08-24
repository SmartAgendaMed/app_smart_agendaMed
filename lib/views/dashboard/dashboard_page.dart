



import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_route.dart';
import 'package:hack10/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:hack10/views/dashboard/views/historic/dashboard_historic_page.dart';
import 'package:hack10/views/dashboard/views/historic/dashboard_historic_route.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_page.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_route.dart';
import 'package:hack10/views/dashboard/views/profile/dashboard_profile_page.dart';
import 'package:hack10/views/dashboard/views/profile/dashboard_profile_route.dart';

class DashboardPage extends StatelessWidget {
  final Widget body;
  const DashboardPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {

    List <AppRoute> routes = [
      DashboardInitialRoute(),
      DashboardHistoricRoute(),
      DashboardProfileRoute(),
    ];
    return Scaffold(
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(

        selectedColor: Theme.of(context).primaryColor,
        currentIndex:context.read<DashboardBloc>().currentRoute,
        customBottomBarItems: [
          CustomBottomBarItems(label: 'Inicio', isAssetsImage: false,
          icon: Icons.home
          ),
          CustomBottomBarItems(label: 'Histórico', isAssetsImage: false,
          icon: Icons.history
          ),
          CustomBottomBarItems(label: 'Perfil', isAssetsImage: false,
          icon: Icons.person
          ),

        ],
        onTap: (int value) {
          context.push(routes[value].routePath);
          context.read<DashboardBloc>().add(
              SelectRoute(value));
      },

      ),
      appBar: AppBar(
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        leading: Icon(
          Icons.notifications
        ),
        backgroundColor: Theme.of(context).cardColor,
        title: Text("Sistema HU"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(Icons.question_mark
              ,
              color: Colors.white,),
            ),
          )
        ],
      ),
      body: body,
    );
  }
}
