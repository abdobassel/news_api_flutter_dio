import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_dio_app/apiDio/apidio.dart';
import 'package:news_dio_app/bloc_observer.dart';
import 'package:news_dio_app/layout/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(const News_App_V2());
}

class News_App_V2 extends StatelessWidget {
  const News_App_V2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_LO(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white),
            backgroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
        ),
      ),
    );
  }
}
