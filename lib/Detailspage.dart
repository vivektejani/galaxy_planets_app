import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galaxy_planets_app/list.dart';



class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
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
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    Global.selected.image,
                    height: height * 0.47,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Global.appColor.withOpacity(0.5),
                    height: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // color: Colors.white,
                      width: double.infinity,
                      color: Global.appColor.withOpacity(0.3),
                      height: height * 0.45,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.16),
                            Text(
                              "OVERVIEW",
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(left: 3),
                              height: 3,
                              color: Colors.lightBlue,
                              width: 25,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              Global.selected.description,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: height * 0.25,
                          width: width * 0.85,
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
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height * 0.07),
                                Text(
                                  Global.selected.planetName,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 28,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Milky-way Galaxy",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 3,
                                  color: Colors.lightBlue,
                                  width: 30,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white.withOpacity(0.5),
                                      size: 18,
                                    ),
                                    Text(
                                      "${Global.selected.distanceFromEarth} km",
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
                                      "${Global.selected.gravity} m/s",
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
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: width,
                          height: height * 0.45,
                          alignment: Alignment.topCenter,
                          child: RotationTransition(
                            turns: animationController,
                            child: Hero(
                              tag: Global.selected.galaxyName,
                              child: Image.asset(
                                Global.selected.image,
                                height: height * 0.18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Global.appColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: height * 0.072,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.lightBlue],
                              ),
                            ),
                            child: Text(
                              "Welcome to ${Global.selected.galaxyName.toUpperCase()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Image.asset(
                            Global.selected.image.toString(),
                            height: 120,
                          ),
                          const Spacer(),
                          Text(
                            "Distance to Sun",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            "${Global.selected.distanceFromSun} million km",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Distance to Earth",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${Global.selected.distanceFromEarth} million km",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const Spacer(),
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: height * 0.072,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlue],
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Text(
                          "START FROM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "\$ ${Global.selected.gravity} m ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    const Text(
                      "Click",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 19,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}