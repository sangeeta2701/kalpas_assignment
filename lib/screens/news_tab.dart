

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kalpas_assignment/utils/colors.dart';
import 'package:kalpas_assignment/utils/constants.dart';

import '../widgets/sizedbox.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        newsContents("assets/images/img1.png"),
        height12,
        newsContents("assets/images/img2.png"),
        height12,
        newsContents("assets/images/img3.png")
      ],
    );
  }

  Widget newsContents(String img) {
    return Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
               
              },
              icon: Icons.favorite,
              label: "Add to Favorite",
              borderRadius: BorderRadius.only(topRight: Radius.circular(12),
              bottomRight: Radius.circular(12)),
              foregroundColor: rColor,
              backgroundColor: rColor.withOpacity(0.2),
            )
          ],
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 145,
          ),
        decoration: BoxDecoration(
          color: wColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Image.asset(img),
              width12,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Purus suspendisse adipiscing quam. Varius magnis in nisl.",style: blackHeading,textAlign: TextAlign.justify,),
                    height4,
                    Text("At leo tellus ornare adipiscing adipiscing pharetra nisi ornare.",style: blackSmallText,textAlign: TextAlign.justify,),
                    height4,
                    Row(children: [
                      Icon(CupertinoIcons.calendar,color: gColor,),
                      width8,
                      Text("Mon, 21 Dec 2020 14:57 GMT",style: greyText,)
                    ],)
                  ],
                ),
              ),

            ],
          ),
        ),
      ));
  }
}