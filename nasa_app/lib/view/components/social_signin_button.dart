import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nasa_app/core/style/app_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String socialMediaName;

  const SocialButton({Key? key, required this.onTap, required this.socialMediaName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoColors.white,
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: CupertinoColors.activeBlue,
                  size: 50,
                ),
              )),
          SizedBox(width: 2.w,),
          Text(socialMediaName,style: AppStyle.itemTitleText,)
        ],
      ), //
    );;
  }
}
