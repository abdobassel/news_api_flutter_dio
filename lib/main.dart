import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_dio_app/apiDio/apidio.dart';
import 'package:news_dio_app/bloc_observer.dart';
import 'package:news_dio_app/cache_helper/cache_helper.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';
import 'package:news_dio_app/layout/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await cacheHelper.init();
  bool isDark = cacheHelper.getDataMode(key: 'isDark');
  DioHelper.init();

  runApp(News_App_V2(isDark: isDark ? true : false));
}

class News_App_V2 extends StatelessWidget {
  final bool isDark;
  const News_App_V2({
    required this.isDark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubitNews(AppNewsInitialState())
        ..getBusiness()
        ..getScince()
        ..getsports()
        ..changeMode(fromShared: isDark),
      child: BlocConsumer<AppCubitNews, AppNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: Home_LO(),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xff313737),
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                  scrolledUnderElevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white),
                  backgroundColor: Color(0xff313737)),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xff313737),
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
              ),
            ),
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  scrolledUnderElevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.black),
                  backgroundColor: Colors.white),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
              ),
            ),
            themeMode: AppCubitNews.get(context).isDark == true
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
