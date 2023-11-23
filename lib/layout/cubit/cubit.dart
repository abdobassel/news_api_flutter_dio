import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/apiDio/apidio.dart';
import 'package:news_dio_app/layout/cubit/states.dart';
import 'package:news_dio_app/layout/screens/business.dart';
import 'package:news_dio_app/layout/screens/science.dart';
import 'package:news_dio_app/layout/screens/sports.dart';

class AppCubitNews extends Cubit<AppNewsState> {
  AppCubitNews(super.initialState);

  static AppCubitNews get(context) => BlocProvider.of(context);

  int currentIndexBottomBar = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScinceScreen(),
  ];

  void changeBtmItem(int index) {
    currentIndexBottomBar = index;
    emit(AppNewsChangeBottomBarItemState());
  }

  //api screens
  // business
  List<dynamic> business = [];

  void getBusiness() {
    emit(AppNewsIsLoadingState());
    DioHelper.getData(urlPath: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '8a80ccfb232846e3abd78a75a59c4eb6'
    }).then((value) {
      print(value.data['articles']);
      business = value.data['articles'];
      emit(AppNewsGetBusinessDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppNewsGetBusinessErrorState(error: 'error get databusiness'));
    });
  }

// sports
  List<dynamic> sports = [];

  void getsports() {
    emit(AppNewsIsLoadingState());
    DioHelper.getData(urlPath: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '8a80ccfb232846e3abd78a75a59c4eb6'
    }).then((value) {
      print(value.data['articles']);
      sports = value.data['articles'];
      emit(AppNewsGetSportssDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppNewsGetSportssErrorState(error: 'error get datasports'));
    });
  }

// scince screen logic
  List<dynamic> scince = [];
  void getScince() {
    emit(AppNewsIsLoadingState());
    DioHelper.getData(urlPath: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '8a80ccfb232846e3abd78a75a59c4eb6'
    }).then((value) {
      print(value.data['articles']);
      scince = value.data['articles'];
      emit(AppNewsGetScinceDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppNewsGetScinceErrorState(error: 'error get dataScince'));
    });
  }
}
