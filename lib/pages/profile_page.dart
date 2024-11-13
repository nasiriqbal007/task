import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task_ui/models/image_model.dart';
import 'package:task_ui/widgets/profile_summary.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double headerHeight = screenHeight * 0.25;
    double avatarRadius = screenWidth * 0.1;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: headerHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 4,
                    right: 4,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "asset/cover_pic.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: headerHeight * 0.78,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: const AssetImage(
                            "asset/profile.jpg",
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          "Olivia Anderson",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.045),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01,
                              horizontal: screenWidth * 0.1),
                          child: const Text(
                            "Just a curious soul, chasing dreams, goals and good vibes",
                            style: TextStyle(
                              color: Color(0xFFCCCDCC),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: headerHeight * 1.7,
                    left: 5,
                    right: 5,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileSummary(
                                count: '51 K',
                                text: 'Followers',
                                buttonText: 'Follow',
                              ),
                              VerticalDivider(
                                color: Color(0xFFCCCDCC),
                                thickness: 2,
                                indent: 2,
                                endIndent: 80,
                              ),
                              ProfileSummary(
                                text: "Followings",
                                count: "1203",
                                buttonText: 'Message',
                              ),
                              VerticalDivider(
                                color: Color(0xFFCCCDCC),
                                thickness: 2,
                                indent: 2,
                                endIndent: 80,
                              ),
                              ProfileSummary(
                                count: "500",
                                text: "Posts",
                                buttonText: 'Insight',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.325,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                padding: const EdgeInsets.only(top: 10),
                labelPadding: const EdgeInsets.only(
                  bottom: 8,
                  top: 0,
                ),
                dividerColor: Colors.grey.shade200,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  SvgPicture.asset(
                    _tabController.index == 0
                        ? "asset/grid-big.svg"
                        : "asset/grid-big-o.svg",
                    height: 25,
                  ),
                  SvgPicture.asset(
                    _tabController.index == 1
                        ? "asset/video-camera.svg"
                        : "asset/video-camera-o.svg",
                    height: 25,
                  ),
                  SvgPicture.asset(
                    _tabController.index == 2
                        ? "asset/heart.svg"
                        : "asset/heart-o.svg",
                    height: 25,
                  ),
                  SvgPicture.asset(
                    _tabController.index == 3
                        ? "asset/bookmark.svg"
                        : "asset/bookmark-o.svg",
                    height: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MasonryGridView.builder(
                      itemCount: imageList.length,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final ImageItem image = imageList[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image.imageurl,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  const Center(child: Text("Tab 2 Content")),
                  const Center(child: Text("Tab 3 Content")),
                  const Center(child: Text("Tab 4 Content")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
