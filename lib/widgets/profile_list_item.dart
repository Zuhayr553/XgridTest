import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:profile_app_ui/constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacer.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: spacer.w * 4,
      ).copyWith(
        bottom: spacer.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: spacer.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacer.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: spacer.w * 2.5,
          ),
          SizedBox(width: spacer.w * 1.5),
          Text(
            this.text,
            style: titletext.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: spacer.w * 2.5,
            ),
        ],
      ),
    );
  }
}
