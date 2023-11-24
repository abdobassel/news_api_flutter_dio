import 'package:flutter/material.dart';

Widget ItemArticleBuilder({
  required String? img,
  required String title,
  required String? date,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: img != null
                          ? NetworkImage(
                              '$img',
                            )
                          : NetworkImage(
                              'https://variety.com/wp-content/uploads/2021/04/Avatar.jpg'),
                      fit: BoxFit.cover))),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Text(
                    "$title",
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$date',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
