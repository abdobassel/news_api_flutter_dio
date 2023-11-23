import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/components.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitNews, AppNewsState>(
        builder: (context, state) {
          var sports = AppCubitNews.get(context).sports;
          return ListView.builder(
            itemBuilder: (context, index) {
              return ItemArticleBuilder(
                  title: sports[index]['title'],
                  img: sports[index]['urlToImage'],
                  date: sports[index]['publishedAt']);
            },
            itemCount: 10,
          );
        },
        listener: (context, state) {});
  }
}
