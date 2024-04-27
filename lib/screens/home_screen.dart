

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_assignment/screens/fav_tab.dart';
import 'package:kalpas_assignment/screens/news_tab.dart';
import 'package:kalpas_assignment/utils/colors.dart';
import 'package:kalpas_assignment/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
   late TabController _tabController;


   @override
  void initState() {
     _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
              color: bgColor,
              height: 50,
              width: double.infinity,
              child: Center(
                child: ButtonsTabBar(
                    controller: _tabController,
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    buttonMargin:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                   
                    backgroundColor: Color.fromRGBO(239, 244, 255, 1),
                    // borderColor: lightBlackColor.withOpacity(0.1),
                    unselectedBackgroundColor: bgColor,
                    labelStyle: blackMainHeading,
                    unselectedLabelStyle: blackMainHeading,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.list,color: bColor,),
                        text: "News",
                      ),
                      Tab(
                        icon: Icon(Icons.favorite,color: rColor,),
                        text: "Favs",
                      ),
                     
                    ]),
              ),
            ),
            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                NewsTab(),
                FavTab(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}