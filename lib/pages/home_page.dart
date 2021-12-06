import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips_app/cubit/app_cubit_states.dart';
import 'package:trips_app/cubit/app_cubits.dart';
import 'package:trips_app/widgets/app_larg_text.dart';
import 'package:trips_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    "welcome-one.jpg": "welcome-one",
    "welcome-two.jpeg": "welcome-two",
    "welcome-three.jpg": "welcome-three",
    "mountain.jpg": "mountain",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {
            if (state is LoadedState) {
              var info = state.places;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // menu text
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // discover text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const AppLargText(text: "Discover"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // tab bar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black54,
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator:
                            CircleTabIndicator(color: Colors.blue, radius: 4),
                        tabs: const [
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Inspirations",
                          ),
                          Tab(
                            text: "Emoitions",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                        itemCount: info!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "http://bslmeiyu.com/uploads/" +
                                      info[index].img!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Text('hello'),
                      Text('hello'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppLargText(
                          text: "Explore more",
                          size: 22,
                        ),
                        AppText(
                          text: "show all",
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "img/" + images.keys.elementAt(index),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color? color;
  double? radius;
  CircleTabIndicator({
    @required this.color,
    @required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color? color;
  double? radius;
  _CirclePainter({
    @required this.color,
    @required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color!;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius! / 2,
        configuration.size!.height - radius! / 2);

    canvas.drawCircle(offset + circleOffset, radius!, _paint);
  }
}
