import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  int _selectedSegment = 0; // Added state for Segmented Control

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'MeetBox',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF443627)),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.ellipsis_vertical, size: 25),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 0),

            // Segmented Control for Tabs
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoSlidingSegmentedControl<int>(
                groupValue: _selectedSegment,
                onValueChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
                children: const {
                  0: Text('Inbox', style: TextStyle(fontSize: 16)),
                  1: Text('Call', style: TextStyle(fontSize: 16)),
                  2: Text('Status', style: TextStyle(fontSize: 16)),
                },
              ),
            ),

            const SizedBox(height: 10),

            // Search Bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CupertinoSearchTextField(
                placeholder: 'Search',
                backgroundColor: Color(0xFFEFDCAB),
                style: TextStyle(color: Color(0xFF443627)),
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),

            const SizedBox(height: 10),

            // Chat List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final chat = chatList[index];
                  return _buildChatItem(
                    chat['name']!,
                    chat['message']!,
                    chat['time']!,
                    chat['assetImage']!,
                    chat['hasUnread']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Chat Item Widget
  Widget _buildChatItem(String name, String message, String time, String assetImage, bool hasUnread) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F1D0),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                assetImage,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(message, style: const TextStyle(fontSize: 15, color: CupertinoColors.systemGrey)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(time, style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 14)),
                if (hasUnread)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(color: CupertinoColors.systemBlue, shape: BoxShape.circle),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Chat Data (All Images as Assets)
final List<Map<String, dynamic>> chatList = [
  {'name': 'Maymay', 'message': 'Asan ka?', 'time': '12:40 PM', 'assetImage': 'assets/homepage/s1.jpg', 'hasUnread': true},
  {'name': 'Benedict', 'message': 'Ingat ka po palagi;>', 'time': '08:40 AM', 'assetImage': 'assets/homepage/s2.jpg', 'hasUnread': false},
  {'name': 'Emerlad', 'message': 'gegegegege', 'time': '04:40 PM', 'assetImage': 'assets/homepage/s3.jpg', 'hasUnread': true},
  {'name': 'Ronye', 'message': 'Yes po', 'time': '05:30 AM', 'assetImage': 'assets/homepage/s4.jpg', 'hasUnread': false},
  {'name': 'Josh', 'message': 'Paki block', 'time': '10:00 AM', 'assetImage': 'assets/homepage/s5.jpg', 'hasUnread': false},
  {'name': 'Jayy Em', 'message': 'Hindi naman malakas', 'time': '09:30 AM', 'assetImage': 'assets/homepage/s6.jpg', 'hasUnread': true},
  {'name': 'RJay', 'message': 'Goodluck po!', 'time': '07:25 PM', 'assetImage': 'assets/homepage/s7.jpg', 'hasUnread': false},
];
