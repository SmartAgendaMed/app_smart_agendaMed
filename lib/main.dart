import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/router/app_router.dart';
// A importação do weather_service foi removida daqui
import 'package:hack10/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:hack10/views/dashboard/views/historic/dashboard_historic_route.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_route.dart';
import 'package:hack10/views/dashboard/views/profile/dashboard_profile_route.dart';
import 'package:hack10/views/login/login_route.dart';

void main() async {
  // O seu código original para iniciar o app.
  runApp( MyApp(
    appRouter: await getAppRouter(
      configuration: RouterConfiguration(
          initialRoute:
          LoginRoute().routePath,
          /* (await sl.get<UserSession-repository>().hasActiveSession())
      ? HomeRoute().routePath
      : LoginRoute().routePath*/
          getModuleRoutes: (_) => [
            LoginRoute(),
            DashboardInitialRoute(),
            DashboardHistoricRoute(),
            DashboardProfileRoute(),
          ]),
    ),
  ));
}

// O resto do seu arquivo (class MyApp, etc.) permanece exatamente igual.

class MyApp extends StatefulWidget {
  final GoRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context)=> DashboardBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: widget.appRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          //scaffoldBackgroundColor: Color(0xffefeeee),

          primaryColor: Color(
              0xff1db09e),
        ),
       // darkTheme: buildDarkTheme(),
        // localizationsDelegates: LanguageResourcesFormatter.of(context).localizationsDelegates(),
        //supportedLocales: AppLocaleUtils.supportedLocales, //sl.get<LanguageResourcesBloc>().supportedLanguages,
        //locale: languageSelectionCubit.state,
      ),
    );
  }
}


