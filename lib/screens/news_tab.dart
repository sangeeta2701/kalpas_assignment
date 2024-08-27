import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kalpas_assignment/utils/colors.dart';
import 'package:kalpas_assignment/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../Models/newsListData.dart';
import '../widgets/sizedbox.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  void initState() {
    super.initState();
    _getsNewsList();
  }

  //get news list
  List<Article> newsList = [];
  Future<void> _getsNewsList() async {
    var url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-07-27&sortBy=publishedAt&apiKey=00a3bb0bad3c4dbbb7f644fde89befe2";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      var _news = newsListDataFromJson(response.body);

      setState(() {
        newsList = _news.articles;
      });
    } else {
      // ignore: use_build_context_synchronously
      Fluttertoast.showToast(msg: "No Data Found");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: newsList.isEmpty?Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            var data = newsList[index];
            return Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {},
                      icon: Icons.favorite,
                      label: "Add to Favorite",
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
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
                        Image.network(data.urlToImage!),
                        width12,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: blackHeading,
                                textAlign: TextAlign.justify,
                              ),
                              height4,
                              Text(
                                data.description,
                                style: blackSmallText,
                                textAlign: TextAlign.justify,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.calendar,
                                    color: gColor,
                                    size: 18.sp,
                                  ),
                                  Text(
                                    data.publishedAt.toString(),
                                    style: greyText,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
   
  }

  
}
