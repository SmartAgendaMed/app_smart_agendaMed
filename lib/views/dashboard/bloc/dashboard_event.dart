part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class SelectRoute extends DashboardEvent {
  final int routeIndex;

  SelectRoute(this.routeIndex);
}

class DashboardLogoutEvent extends DashboardEvent {}