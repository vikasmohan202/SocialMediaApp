import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    print("init");
    pageController = PageController();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: PageView(
        children: [
          FeedScreen(),
          Text('hom'),
          AddPostScreen(),
          Text('ho'),
          Text('hme'),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? mobileBackgroundColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? mobileBackgroundColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? mobileBackgroundColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _page == 3 ? mobileBackgroundColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? mobileBackgroundColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
