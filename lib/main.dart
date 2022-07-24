import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:profile_app_ui/constants.dart';
import 'package:profile_app_ui/widgets/profile_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: darktheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: spacer.w * 10,
            width: spacer.w * 10,
            margin: EdgeInsets.only(top: spacer.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/11.PNG'),
                      radius: 40,
                    )),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Container(
                //     height: spacer.w * 2.5,
                //     width: spacer.w * 2.5,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).accentColor,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Center(
                //       heightFactor: spacer.w * 1.5,
                //       widthFactor: spacer.w * 1.5,
                //       // child: Icon(
                //       //   LineAwesomeIcons.pen,
                //       //   color: primarycolor,
                //       //   size: ScreenUtil().setSp(spacer.w * 1.5),
                //       // ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: spacer.w * 2),
          Text(
            'John Doe',
            style: titletext,
          ),
          SizedBox(height: spacer.w * 0.5),
          Text(
            'john.doe@example.com',
            style: caption,
          ),
          SizedBox(height: spacer.w * 2),
          Container(
            height: spacer.w * 4,
            width: spacer.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spacer.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: button,
              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: lighttheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(spacer.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: darktheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(spacer.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: spacer.w * 3),
        // Icon(
        //   LineAwesomeIcons.arrow_left,
        //   size: ScreenUtil().setSp(spacer.w * 3),
        // ),
        profileInfo,
        themeSwitcher,
        SizedBox(width: spacer.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: spacer.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_shield,
                        text: 'Privacy',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: 'Purchase History',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Settings',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_plus,
                        text: 'Invite a Friend',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
