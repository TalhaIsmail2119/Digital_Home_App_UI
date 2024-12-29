import 'package:digital_home/contants/constants.dart';
import 'package:digital_home/models/applinces.dart';
import 'package:digital_home/models/interior.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late TabController _tabController;

  @override
  void initState(){


    super.initState();
    _tabController =TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5, vertical: defaultPadding * 2),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Hello Sup!',
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding * 1.5),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: demoHomeInterior.length,
                  itemBuilder: (context, index) {
                    return homeCard(demoHomeInterior[index]);
                  }),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotColor: Colors.grey.withOpacity(0.3),
                activeDotColor: secondaryColor,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
            child: Text(
              'My Devices',
              style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:  defaultPadding,
                ),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: demoHomeDevices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQuery.of(context).size.width / 2 - 36,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return deviceCard(demoHomeDevices[index]);
                    }),
              ))
        ],
      )),
      bottomNavigationBar: Container(
        height: 78,
        color: bgColor,
        padding: EdgeInsets.all(10),
        child: TabBar(
          labelColor: secondaryColor,
          unselectedLabelColor: Colors.grey.shade400,
          controller: _tabController,
          indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
          tabs: [
            ImageIcon(
              AssetImage('assets/icons/img_1.png'),
              size: 35,
            ),
            ImageIcon(
              AssetImage('assets/icons/img_3.png'),
              size: 35,
            ),
            ImageIcon(
              AssetImage('assets/icons/img.png'),
              size: 35,
            ),
            ImageIcon(
              AssetImage('assets/icons/ac.png'),
              size: 35,
            ),
          ],
        ),
      ),
    );
  }

  // Method Device Card

  Container deviceCard(HomeDevices homeDevices) {
    return Container(
      padding: EdgeInsets.all(defaultPadding * 2),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(33),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              homeDevices.image,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  // Method Home Card

  Padding homeCard(HomeInterior homeInterior) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              homeInterior.image,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Text(
              homeInterior.title,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
