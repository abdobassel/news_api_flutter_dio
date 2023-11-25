import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_dio_app/components.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/layout/cubit/states.dart';

class SearchNewsScreen extends StatelessWidget {
  SearchNewsScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitNews, AppNewsState>(
        builder: (context, state) {
          var search = AppCubitNews.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultTextForm(
                    type: TextInputType.text,
                    controller: searchController,
                    labeltext: 'Search',
                    validate: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return 'يجب ان لايكون حقل البحث فارغ ';
                        }
                        return null;
                      }
                    },
                    onchange: (value) {
                      AppCubitNews.get(context).getSearchdata(value!);
                    },
                    prefix: Icons.search),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return search.isNotEmpty
                        ? ItemArticleBuilder(
                            context,
                            url: search[index]['url'],
                            title: search[index]['title'],
                            img: search[index]['urlToImage'],
                            date: search[index]['publishedAt'],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                  itemCount: 10,
                ),
              )
            ]),
          );
        },
        listener: (context, state) {});
  }
}
