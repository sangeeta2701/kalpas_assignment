// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kalpas_assignment/screens/news_detail_screen.dart';
// import 'package:kalpas_assignment/utils/colors.dart';
// import 'package:kalpas_assignment/widgets/sizedbox.dart';

// import '../utils/constants.dart';

// class FavTab extends StatefulWidget {
//   const FavTab({super.key});

//   @override
//   State<FavTab> createState() => _FavTabState();
// }

// class _FavTabState extends State<FavTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         favContents("assets/images/img1.png"),
//         height12,
//         favContents("assets/images/img2.png"),
//       ],
//     );
//   }

//   Widget favContents(String img) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailScreen()));
//       },
//       child: Container(
//         constraints: BoxConstraints(
//           maxHeight: 145.h,
//         ),
//         decoration: BoxDecoration(
//           color: wColor,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             children: [
//               Image.asset(img),
//               width12,
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Purus suspendisse adipiscing quam. Varius magnis in nisl.",
//                       style: blackHeading,
                      
//                     ),
//                     height4,
//                     Text(
//                       "At leo tellus ornare adipiscing adipiscing pharetra nisi ornare.",
//                       style: blackSmallText,
                      
//                     ),
//                     height4,
//                     Row(
//                       children: [
//                         Icon(
//                           CupertinoIcons.calendar,
//                           color: gColor,
//                           size: 18.sp,
//                         ),
                        
//                         Text(
//                           "Mon, 21 Dec 2020 14:57 GMT",
//                           style: greyText,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// fav_tab.dart

import 'package:flutter/material.dart';
import 'package:kalpas_assignment/Provider/favoriteProvider.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';

class FavTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favorites;

    return favorites.isEmpty
        ? Center(child: Text("No Favorites Added"))
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              var data = favorites[index];
              return ListTile(
                leading: data.urlToImage != null
                    ? Image.network(
                        data.urlToImage!,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : null,
                title: Text(data.title!),
                subtitle: Text(data.description!),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: rColor),
                  onPressed: () {
                    context.read<FavoriteProvider>().removeFavorite(data);
                  },
                ),
              );
            },
          );
  }
}
