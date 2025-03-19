import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF443627),
          ),
        ),
        backgroundColor: Color(0xFFF2F6D0),
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back, color: Color(0xFF443627)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/600x300'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Center(
              child: Column(
                children: [
                  const Text('Bern Soria', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF443627))),
                  const Text('@bernstien', style: TextStyle(color: Color(0xFFD98324), fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatItem('199', 'Posts'),
                      _buildStatItem('1.2M', 'Following'),
                      _buildStatItem('15.5M', 'Followers'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('About Me'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'A 3rd Year Computer Engineering Student who wants to fly high. LOL',
                style: TextStyle(color: Color(0xFF443627), fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('Shared'),
            Column(
              children: List.generate(1, (index) => _buildSharedItem('Useful post about tech and AI', index)),
            ),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              child: Text(
                'No more',
                style: TextStyle(color: Color(0xFF443627), fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF443627))),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF443627))),
    );
  }

  Widget _buildSharedItem(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFEFDCAB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFD98324),
              child: const Icon(CupertinoIcons.doc_text, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text, style: const TextStyle(color: Color(0xFF443627), fontSize: 16)),
            ),
            const Icon(CupertinoIcons.forward, color: Color(0xFF443627)),
          ],
        ),
      ),
    );
  }
}
