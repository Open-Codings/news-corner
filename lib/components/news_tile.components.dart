// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_pens_s3_pbo_theory/models/article.model.dart';
import 'package:flutter_pens_s3_pbo_theory/pages/detail.page.dart';

class NewsTile extends StatefulWidget {
  NewsTile(this.data, {super.key});
  Article data;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(widget.data),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(12.0),
        height: 130,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 217, 217, 217),
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Hero(
                tag: "${widget.data.title}",
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(widget.data.urlToImage ??
                            "https://gitlab.com/skye-home/assets/-/raw/main/lectures/pens/s3/pbo/skeleton-1.jpg"),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.source!.name ?? "",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 82, 3),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 25, 20, 84),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.data.author ?? "Anonymous",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 151, 151, 151),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Read More",
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
