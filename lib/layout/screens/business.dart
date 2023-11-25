import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/components.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitNews, AppNewsState>(
        builder: (context, state) {
          var business = AppCubitNews.get(context).business;
          return ListView.builder(
            itemBuilder: (context, index) {
              return business.isNotEmpty
                  ? ItemArticleBuilder(
                      title: business[index]['title'],
                      img: business[index]['urlToImage'],
                      date: business[index]['publishedAt'])
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
