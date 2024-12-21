import 'package:flutter/material.dart';
import 'package:tired/screen/signin.dart';
import 'package:tired/change.dart';

class ISTEApp extends StatefulWidget {
  const ISTEApp({super.key});

  @override
  _ISTEAppState createState() => _ISTEAppState();
}

class _ISTEAppState extends State<ISTEApp> {
  int currentIndex = 0;
  bool isDarkMode = false;

  final List<Widget> pages = [
    LandingPage(),
    ChatPage(),
    TeamPage(),
    MoreOptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'ISTE : NITK',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            // Profile action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: isDarkMode ? Colors.white : Colors.black,
            width: 1.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.deepPurpleAccent]
                : [Colors.white, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More Options',
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
    (Theme.of(context).brightness == Brightness.dark); // Local check

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'CHAITANYA MENON',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'CRYPT',
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Mazdoor',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'UPCOMING EVENTS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 16),
            EventBox(
              title: 'Dec 2: ISTE Meet the new recruits!',
              isDarkMode: isDarkMode,
            ),
            EventBox(
              title: 'Dec 5: ISTE CRYPT : Meet\'n Greet',
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: 32),
            Text(
              'NOTIFICATIONS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 16),
            NotificationBox(
              sender: 'Ansh',
              message: 'Be there on time!',
              isDarkMode: isDarkMode,
            ),
            NotificationBox(
              sender: 'Harsh',
              message: 'RR on December 6 bois!',
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

class EventBox extends StatelessWidget {
  final String title;
  final bool isDarkMode;

  const EventBox({super.key, required this.title, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  final String sender;
  final String message;
  final bool isDarkMode;

  const NotificationBox({super.key, 
    required this.sender,
    required this.message,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            child: Text(
              sender[0],
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '$sender: $message',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text(
        'New chats here!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text(
        'Team Details here!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.person,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          title: Text(
            'Profile',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(isDarkMode: isDarkMode),
              ),
            );
          },
        ),
        Divider(color: isDarkMode ? Colors.white : Colors.black),
        ListTile(
          leading: Icon(
            Icons.lock,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          title: Text(
            'Change Password',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChangePasswordScreen()
              ),
            );
          },
        ),
        Divider(color: isDarkMode ? Colors.white : Colors.black),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SignInScreen(),
              ),
            );
          },
        ),
        Divider(color: isDarkMode ? Colors.white : Colors.black),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;

  const ProfilePage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Profile Page can include: ISTE ID,Club Details,Projects,personal information etc..',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  final bool isDarkMode;

  const ChangePasswordPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Here you can change your password!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}