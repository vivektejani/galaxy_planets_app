import 'package:flutter/material.dart';
import 'package:galaxy_planets_app/list.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.appColor,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.072,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Text(
                    "Galaxy Planets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Global.planets.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding:
                    const EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Global.selected = Global.planets[i];

                        Navigator.of(context).pushNamed("details_page");
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: height * 0.20,
                              width: width * 0.75,
                              decoration: BoxDecoration(
                                color: Global.appColor2,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              padding: EdgeInsets.only(
                                top: 20,
                                left: width * 0.19,
                                bottom: 20,
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        Global.planets[i].planetName,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 26,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.white.withOpacity(0.5),
                                        size: 21,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Milky-way Galaxy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 3,
                                    color: Colors.lightBlue,
                                    width: 30,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white.withOpacity(0.5),
                                        size: 18,
                                      ),
                                      Text(
                                        "${Global.planets[i].distanceFromEarth} km",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.keyboard_double_arrow_down,
                                        color: Colors.white.withOpacity(0.5),
                                        size: 19,
                                      ),
                                      Text(
                                        "${Global.planets[i].gravity} m/s",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      const SizedBox(width: 1.5),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.20,
                            alignment: Alignment.centerLeft,
                            child: RotationTransition(
                              turns: animationController,
                              child: Hero(
                                tag: Global.planets[i].galaxyName,
                                child: Image.asset(
                                  Global.planets[i].image,
                                  height: height * 0.14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}