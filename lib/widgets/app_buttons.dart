import 'package:flutter/material.dart';
import 'package:trips_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color? color;
  final String? text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool? isIcon;
  double? size;
  AppButtons({
    Key? key,
    @required this.size,
    this.text = "hi",
    this.icon,
    @required this.color,
    @required this.backgroundColor,
    @required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: !isIcon!
          ? Center(
              child: AppText(
                text: text,
                color: color,
              ),
            )
          : Center(
              child: Icon(icon),
            ),
    );
  }
}
