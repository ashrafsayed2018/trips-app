import 'package:flutter/material.dart';
import 'package:trips_app/widgets/app_buttons.dart';
import 'package:trips_app/widgets/app_larg_text.dart';
import 'package:trips_app/widgets/app_text.dart';
import 'package:trips_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/mountain.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppLargText(
                          text: "Yosemite",
                          color: Colors.black54,
                        ),
                        AppLargText(
                          text: "\$ 250",
                          color: Colors.black.withOpacity(.6),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AppText(
                          text: "USA California",
                          color: Colors.black.withOpacity(.5),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? Colors.yellow.withOpacity(.9)
                                    : Colors.grey.withOpacity(.5),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: "4.0",
                          color: Colors.black.withOpacity(.5),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargText(
                      text: "People",
                      color: Colors.black.withOpacity(.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const AppText(
                        text: "Number of people in your group",
                        color: Colors.grey),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AppButtons(
                            size: 50,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: selectedIndex == index
                                ? Colors.black
                                : Colors.grey[300],
                            borderColor: selectedIndex == index
                                ? Colors.black
                                : Colors.grey[300],
                            text: (index + 1).toString(),
                            isIcon: false,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargText(
                      text: 'Description',
                      color: Colors.black.withOpacity(.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          'you should go for travel and enjoy the nature and mountains you should go for travel and enjoy the nature and mountains you should go for travel',
                      color: Colors.grey[600],
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      size: 60,
                      color: Colors.grey[500],
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey,
                      isIcon: true,
                      icon: Icons.favorite_outline,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
