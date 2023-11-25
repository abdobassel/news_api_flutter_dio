abstract class AppNewsState {}

class AppNewsInitialState extends AppNewsState {}

class AppNewsChangeBottomBarItemState extends AppNewsState {}

class AppNewsGetBusinessDataState extends AppNewsState {}

class AppNewsIsLoadingState extends AppNewsState {}

class AppNewsGetBusinessErrorState extends AppNewsState {
  final String error;

  AppNewsGetBusinessErrorState({required this.error});
}

class AppNewsGetSportssDataState extends AppNewsState {}

class AppNewsGetSportssErrorState extends AppNewsState {
  final String error;

  AppNewsGetSportssErrorState({required this.error});
}

class AppNewsGetScinceDataState extends AppNewsState {}

class AppNewsGetScinceErrorState extends AppNewsState {
  final String error;

  AppNewsGetScinceErrorState({required this.error});
}

class AppNewsChangeModeState extends AppNewsState {}

class AppNewsGetSearchErrorState extends AppNewsState {
  final String error;

  AppNewsGetSearchErrorState({required this.error});
}

class AppNewsSearchState extends AppNewsState {}
