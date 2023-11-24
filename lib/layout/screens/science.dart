import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/components.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';

class ScinceScreen extends StatelessWidget {
  const ScinceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitNews, AppNewsState>(
        builder: (context, state) {
          var scince = AppCubitNews.get(context).scince;
          return ListView.builder(
            itemBuilder: (context, index) {
              return scince.isNotEmpty
                  ? ItemArticleBuilder(
                      title: scince[index]['title'],
                      img: scince[index]['urlToImage'],
                      date: scince[index]['publishedAt'])
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
            itemCount: 10,
          );
        },
        listener: (context, state) {});
  }
}
