import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_assignment/utils/colors.dart';
import 'package:kalpas_assignment/utils/constants.dart';
import 'package:kalpas_assignment/widgets/sizedbox.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

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
                        icon: Icon(Icons.arrow_back_ios,color: bColor,)),
                      width4,
                      Text("Back",style: blackHeading,)
                  ],
                ),
                height16,
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 200
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage("assets/images/img4.png"),fit: BoxFit.cover)
                  ),
                ),
                height16,
                Text(
                        "Purus suspendisse adipiscing quam. Varius magnis in nisl.",
                        style: blackMainHeading,
                        
                      ),
                      height4,
                      
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.calendar,
                            color: gColor,
                          ),
                          width8,
                          Text(
                            "Mon, 21 Dec 2020 14:57 GMT",
                            style: greyText,
                          )
                        ],
                      ),
                      height8,
                      Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,Lorem ipsum dolor sit amet, comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",style: blackSmallText,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
