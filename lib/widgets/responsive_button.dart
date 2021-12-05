import 'package:flutter/material.dart';
import 'package:trips_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive! ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        child: Row(
          mainAxisAlignment: isResponsive!
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isResponsive!
                ? const AppText(
                    text: 'Book trip now',
                    color: Colors.white,
                  )
                : Container(),
            Image.asset(
              'img/button-one.png',
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
