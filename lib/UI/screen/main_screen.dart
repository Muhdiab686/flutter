import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pro/core/app_assets.dart';
import 'package:pro/core/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController = PageController();
  late Timer t;
  late Size size;
  @override
  void initState() {
    t = Timer.periodic(const Duration(seconds: 2), (w) {
      if (pageController.page! >= 5.0) {
        pageController.jumpTo(0.0);
      }
      pageController.nextPage(
          duration: const Duration(seconds: 2), curve: Curves.easeInOut);
    });
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(AppAssets.logo),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.grey.withOpacity(0.3),
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: PageView.builder(
                  itemCount: 5,
                  controller: pageController,
                  itemBuilder: (_, i) {
                    return Container(
                      width: size.width - 20,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppAssets.logo)),
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.secondaryColor),
                    );
                  }),
            ),
            SizedBox(
                height: 400,
                child: GridView.builder(
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, i) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: AppColors.secondaryColor),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(AppAssets.logo)),
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColors.secondaryColor),
                            ),
                            const Text(
                              "Check out PUBG",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
