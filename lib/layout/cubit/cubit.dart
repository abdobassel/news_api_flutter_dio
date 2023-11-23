import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
