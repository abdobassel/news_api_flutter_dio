import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/apiDio/apidio.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';
import 'package:news_dio_app/layout/screens/search_screen.dart';

class Home_LO extends StatelessWidget {
  const Home_LO({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitNews, AppNewsState>(
        builder: ((context, state) {
          var cubit = AppCubitNews.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.data_array)),
            appBar: AppBar(
              titleSpacing: 20.0,
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchNewsScreen()));
                    },
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {
                      cubit.changeMode();
                    },
                    icon: Icon(
                      Icons.brightness_4,
                      size: 25,
                    ))
              ],
            ),
            body: cubit.screens[cubit.currentIndexBottomBar],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndexBottomBar,
                onTap: (index) {
                  cubit.changeBtmItem(index);
                },
                items: [
                  BottomNavigationBarItem(
                      label: 'business', icon: Icon(Icons.business)),
                  BottomNavigationBarItem(
                      label: 'Sports',
                      icon: Icon(Icons.sports_basketball_outlined)),
                  BottomNavigationBarItem(
                      label: 'Scince', icon: Icon(Icons.science)),
                ]),
          );
        }),
        listener: (context, state) {});
  }
}
