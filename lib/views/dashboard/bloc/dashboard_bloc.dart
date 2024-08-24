import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  int currentRoute = 0;
  DashboardBloc() : super(DashboardInitial()) {
    on<SelectRoute>((event, emit) {
      currentRoute = event.routeIndex;
      emit(DashboardRouteSelected(event.routeIndex));
    });

    on<DashboardLogoutEvent>((event, emit) {
      currentRoute = 0;
    });
  }
}
