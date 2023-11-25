import 'package:flutter/material.dart';
import 'package:news_dio_app/layout/cubit/cubit.dart';
import 'package:news_dio_app/webview/web_view.dart';

Widget ItemArticleBuilder(
  context, {
  required String url,
  required String? img,
  required String title,
  required String? date,
}) =>
    InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewScreen(url: '$url');
        }));
      },
      child: Padding(
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
      ),
    );

Widget DefaultTextForm({
  required TextEditingController controller,
  required String? labeltext,
  required String? Function(String?)? validate,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onchange, //null-safety
  required TextInputType type,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffixIcon,
  Function()? showPassfunc,
  Function()? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      onChanged: onchange,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: validate,
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: labeltext,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        prefix: Icon(
          prefix,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: showPassfunc, icon: Icon(suffixIcon))
            : null,
      ),
    );
