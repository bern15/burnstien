import 'package:flutter/cupertino.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'inbox.dart';
import 'profile.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: const Color(0xFFD98324),
        inactiveColor: const Color(0xFF443627),
        backgroundColor: const Color(0xFFF2F6D0),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.envelope), label: 'MeetBox'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeTab();
          case 1:
            return const SearchPage();
          case 2:
            return const InboxPage();
          case 3:
            return const ProfilePage();
          case 4:
            return const SettingsPage();
          default:
            return const HomeTab();
        }
      },
    );
  }
}

// ======================= Home Tab =======================
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> usernames = ['Your story', 'Maymay', 'Benedict', 'Emerlad', 'Ronye', 'Josh'];

    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("BURNSTIEN",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF443627),
                        )),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.heart, color: Color(0xFF443627)),
                        SizedBox(width: 20),
                        Icon(CupertinoIcons.paperplane, color: Color(0xFF443627)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xFFEFDCAB),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundImage: AssetImage('assets/homepage/s$index.jpg'),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            usernames[index],
                            style: const TextStyle(fontSize: 12, color: Color(0xFF443627)),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const PostWidget(
                  profileImage: 'assets/homepage/prof3.jpg',
                  username: 'Takbong Pogi',
                  postImage: 'assets/homepage/post3.jpg',
                  caption: "Boring my day mo kaya ako.",
                  likedBy: "Amber and 124 others",
                ),
                const PostWidget(
                  profileImage: 'assets/homepage/prof2.jpg',
                  username: 'Kalahi',
                  postImage: 'assets/homepage/post2.jpg',
                  caption: "Goodbye Kiss:>",
                  likedBy: "JB and 98 others",
                ),
                const PostWidget(
                  profileImage: 'assets/homepage/prof1.jpg',
                  username: 'M O O D E S T',
                  postImage: 'assets/homepage/post1.jpg',
                  caption: "problemado pero masarap pa rin",
                  likedBy: "Benedict and 210 others",
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================= Post Widget =======================
class PostWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final String postImage;
  final String caption;
  final String likedBy;

  const PostWidget({
    super.key,
    required this.profileImage,
    required this.username,
    required this.postImage,
    required this.caption,
    required this.likedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(profileImage),
            ),
            title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF443627))),
            trailing: const Icon(CupertinoIcons.ellipsis, color: Color(0xFF443627)),
          ),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(postImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(CupertinoIcons.heart, size: 30, color: Color(0xFFD98324)),
              SizedBox(width: 10),
              Icon(CupertinoIcons.chat_bubble, size: 30, color: Color(0xFFD98324)),
              SizedBox(width: 10),
              Icon(CupertinoIcons.paperplane, size: 30, color: Color(0xFFD98324)),
              Spacer(),
              Icon(CupertinoIcons.bookmark, size: 30, color: Color(0xFFD98324)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Liked by $likedBy", style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF443627))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Text(caption, style: const TextStyle(color: Color(0xFF443627))),
        ),
      ],
    );
  }
}
