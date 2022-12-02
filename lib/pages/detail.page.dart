// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_pens_s3_pbo_theory/models/article.model.dart';

class Detail extends StatefulWidget {
  Detail(this.data, {super.key});
  Article data;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share_outlined,
              color: Color.fromARGB(255, 255, 82, 3),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "${widget.data.title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(widget.data.urlToImage ??
                    "https://gitlab.com/skye-home/assets/-/raw/main/lectures/pens/s3/pbo/skeleton-1.jpg"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.data.title!,
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.data.author ?? "Anonymous",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 82, 3),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              widget.data.content ?? "",
              style: TextStyle(
                color: Color.fromARGB(255, 100, 100, 100),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
