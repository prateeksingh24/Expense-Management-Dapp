part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DasboardInitialFetchEvent extends DashboardEvent{}

class DashboardLoadingState extends DashboardState{}
class DashboardErrorgState extends DashboardState{}
class DashboardSuccessState extends DashboardState{}
