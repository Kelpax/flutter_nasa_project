import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasa_app/core/style/app_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class RoverListItem extends StatelessWidget {
  final String imagePath;
  final String fullName;
  final String earthDate;
  final String roverName;

  const RoverListItem({Key? key,  required this.imagePath,  required this.fullName,  required this.earthDate, required this.roverName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey4,style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:  MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
              child: Center(child: Image.network(imagePath, loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }),)),
          Container(
            padding: EdgeInsets.only(left: 10,top: 2,bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.start,
              children: [
                Text((fullName.length>20?"${fullName.substring(0,20)}...":fullName),style: AppStyle.itemTitleText,),
                SizedBox(height: 3.h,),
                Text(earthDate,style: AppStyle.itemSubTitleText,),
                Text(roverName,style: AppStyle.itemSubTitleText),
              ],
            ),
          )
        ],
      ),
    );
  }
}
