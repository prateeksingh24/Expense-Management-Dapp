import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DasboardInitialFetchEvent>(dasboardInitialFetchEvent);
  }

  FutureOr<void> dasboardInitialFetchEvent(
      DasboardInitialFetchEvent event, Emitter<DashboardState> emit) {
    emit(DashboardLoadingState());
  }
}
