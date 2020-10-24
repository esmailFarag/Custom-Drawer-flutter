import 'package:drawer/Style/theme.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final IconData icon2;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;
  final Tooltip tooltip;

  CollapsingListTile(
      {@required this.title,
      @required this.icon,
      this.icon2,
        this.tooltip,
      @required this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 200, end: 70).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Tooltip(
              message: widget.title,
              child: Icon(
                widget.icon,
                color: widget.isSelected ? selectedColor : Colors.white30,
                size: 20.0,
              ),
            ),

            SizedBox(
              width: 8,
            ),
            Icon(
              widget.icon2,
              color: widget.isSelected ? selectedColor : Colors.white30,
              size: 10.0,
            ),
            SizedBox(width: sizedBoxAnimation.value * .02),
            (widthAnimation.value >= 190)
                ? Text(widget.title,
                    style: widget.isSelected
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle)
                : Container()
          ],
        ),
      ),
    );
  }
}
