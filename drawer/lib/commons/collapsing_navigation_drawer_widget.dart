import 'package:drawer/Style/theme.dart';
import 'package:drawer/commons/collapsing_list_tile_widget.dart';
import 'package:drawer/models/navigation_model.dart';

import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 200;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      // elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            CollapsingListTile(
              title: 'Profile',
              icon: Icons.person,
              animationController: _animationController,
              onTap: () => print("Tap profile."),
            ),
            Divider(
              color: Colors.grey,
              height: 10.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    height: 5.0,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePagexc()),
                        );*/
                      });
                    },
                    icon2: (currentSelectedIndex == counter) && isCollapsed
                        ? Icons.arrow_back_ios
                        : null,
                    tooltip: (currentSelectedIndex == counter) && isCollapsed
                        ? Tooltip(
                            message: navigationItems[counter].title,

                          )
                        : null,
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: selectedColor,
                size: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
