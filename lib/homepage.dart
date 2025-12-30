import 'package:facebook/login.dart';
import 'package:flutter/material.dart';
import './login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.search, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.message, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 26,
                    color: _selectedIndex == 0
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.tv,
                    size: 26,
                    color: _selectedIndex == 1
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: Icon(
                    Icons.people,
                    size: 26,
                    color: _selectedIndex == 2
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: Icon(
                    Icons.store,
                    size: 26,
                    color: _selectedIndex == 3
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                  icon: Icon(
                    Icons.notifications,
                    size: 26,
                    color: _selectedIndex == 4
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 5;
                    });
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 26,
                    color: _selectedIndex == 5
                        ? const Color(0xFF1877F2)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  // Widget _tabIcon(IconData icon, int index) {
  //   final isActive = _selectedIndex == index;

  //   return ;
  // }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _homeFeed();
      case 1:
        return const Center(child: Text("Watch"));
      case 2:
        return const Center(child: Text("Friends"));
      case 3:
        return const Center(child: Text("Marketplace"));
      case 4:
        return const Center(child: Text("Notifications"));
      default:
        return const Center(child: Text("Menu"));
    }
  }

  Widget _homeFeed() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/a.png')),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.photo, color: Colors.green),
              ],
            ),
          ),
          const Divider(thickness: 8),
          Container(
            color: Colors.white,
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: [
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/a.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 40,
                        left: 45,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.blue),
                        ),
                      ),
                      const Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: Text(
                          'Create Story',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/music-bot.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 8),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("Postsss."),
                SizedBox(height: 10),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
