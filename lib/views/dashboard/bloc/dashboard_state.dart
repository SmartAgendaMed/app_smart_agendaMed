part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

class DashboardRouteSelected extends DashboardState {
  final int routeIndex;

  DashboardRouteSelected(this.routeIndex);
}