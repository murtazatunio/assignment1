import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bunny_appbar.dart';
import 'package:flutter_application_2/widgets/comments_tile.dart';
import 'package:flutter_application_2/widgets/posts_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      initialIndex: 0, // Default tab index (0 for PostsPage)
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BackgroundWaveClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFCBF49),
                          Color(0xFFF77F00),
                          Color(0xDDDC7100)
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/profile_picture.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: const Text(
                          'John Doe exists. John Doe builds. John Doe innovates. What\'s next? Only time will tell...',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            TabBar(
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Comments'),
                Tab(text: 'Stats'),
              ],
              indicatorColor: Colors.red,
              indicatorWeight: 1,
              labelColor: Colors.red,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
              unselectedLabelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PostsPage(),
                  CommentsPage(),
                  StatsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("19",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                Text("Posts", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text("32",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                Text("Comments", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
