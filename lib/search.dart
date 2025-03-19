import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final List<bool> _isFollowing = List.generate(5, (_) => false);

  // User Data
  final List<Map<String, dynamic>> users = [
    {'name': 'John Benedict', 'image': 'assets/search_profile/user1.jpg', 'mutuals': 20},
    {'name': 'Emechu Marichu', 'image': 'assets/search_profile/user2.jpg', 'mutuals': 15},
    {'name': 'Shun Thukan', 'image': 'assets/search_profile/user3.jpg', 'mutuals': 4},
    {'name': 'Lyka Panganiban', 'image': 'assets/search_profile/user4.jpg', 'mutuals': 19},
    {'name': 'Engr. Dan Manuel', 'image': 'assets/search_profile/user5.jpg', 'mutuals': 10},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Search',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF443627)),
        ),
        backgroundColor: const Color(0xFFF2F6D0),
        border: const Border(bottom: BorderSide(color: Color(0xFFEFDCAB), width: 0.5)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.xmark, color: Color(0xFF443627), size: 22),
        ),
      ),
      child: Column(
        children: [
          // Search Bar
          const Padding(
            padding: EdgeInsets.all(16),
            child: CupertinoSearchTextField(
              placeholder: 'Search',
              backgroundColor: Color(0xFFEFDCAB),
              style: TextStyle(color: Color(0xFF443627)),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),

          // Recent Search Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF443627)),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Clear All',
                    style: TextStyle(color: Color(0xFFD98324), fontSize: 16),
                  ),
                  onPressed: () {}, // Implement clear functionality
                ),
              ],
            ),
          ),

          // User List
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => _buildUserTile(index),
            ),
          ),
        ],
      ),
    );
  }

  // User Tile Widget
  Widget _buildUserTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Profile Picture
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              users[index]['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  users[index]['name']!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF443627)),
                ),
                Text(
                  '${users[index]['mutuals']} mutual friends',
                  style: const TextStyle(color: Color(0xFFD98324), fontSize: 14),
                ),
              ],
            ),
          ),

          // Follow Button
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: _isFollowing[index] ? const Color(0xFFEFDCAB) : const Color(0xFFD98324),
            borderRadius: BorderRadius.circular(20),
            child: Text(
              _isFollowing[index] ? 'Requesting' : 'Add Friend',
              style: TextStyle(color: _isFollowing[index] ? const Color(0xFF443627) : CupertinoColors.white),
            ),
            onPressed: () {
              setState(() {
                _isFollowing[index] = !_isFollowing[index];
              });
            },
          ),
        ],
      ),
    );
  }
}
