import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_assignment/utils/colors.dart';
import 'package:kalpas_assignment/utils/constants.dart';
import 'package:kalpas_assignment/widgets/sizedbox.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.imageUrl, required this.title, required this.description});
  final String imageUrl;
  final String title;
  final String description;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: bColor,
                        )),
                    width4,
                    Text(
                      "Back",
                      style: blackHeading,
                    )
                  ],
                ),
                height16,
                Container(
                  constraints: BoxConstraints(maxHeight: 200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover)),
                ),
                height16,
                Text(
                widget.title,
                  style: blackMainHeading,
                ),
                height4,
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      color: gColor,
                    ),
                    Text(
                      "Mon, 21 Dec 2020 14:57 GMT",
                      style: greyText,
                    )
                  ],
                ),
                height8,
                Text(
                  widget.description,
                  style: blackSmallText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
