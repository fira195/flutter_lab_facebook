import 'package:flutter/material.dart';
import './login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Story widget
class StoryCard extends StatelessWidget {
  final String image;
  final bool isCreateStory;

  const StoryCard({super.key, required this.image, this.isCreateStory = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isCreateStory ? Colors.grey.shade300 : null,
        image: !isCreateStory
            ? DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (isCreateStory)
            const Positioned(
              bottom: 40,
              left: 45,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.add, color: Colors.blue),
              ),
            ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Text(
              isCreateStory ? "Create Story" : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Post widget
class PostCard extends StatefulWidget {
  final String userName;
  final String userImage;
  final String text;
  final String? postImage;

  const PostCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.text,
    this.postImage,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int likes = 0;
  bool isLiked = false;
  List<String> comments = [];
  bool showCommentBox = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(widget.userImage)),
              const SizedBox(width: 8),
              Text(widget.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          // Text
          Text(widget.text),
          const SizedBox(height: 10),
          if (widget.postImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.postImage!),
            ),
          const SizedBox(height: 10),
          const Divider(),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                      color: isLiked ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          likes = 0;
                          isLiked = false;
                        } else {
                          likes = 1;
                          isLiked = true;
                        }
                      });
                    },
                  ),
                  Text("$likes"),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {
                  setState(() {
                    showCommentBox = !showCommentBox;
                  });
                },
              ),
            ],
          ),

          // Comment box
          if (showCommentBox) ...[
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: "Write a comment...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      setState(() {
                        comments.add(_commentController.text);
                        _commentController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...comments.map((c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(c),
                )),
          ],
        ],
      ),
    );
  }
}

// Home page
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> storyImages = [
    'assets/a.jpg',
    'assets/a.jpg',
    'assets/a.jpg',
    'assets/a.jpg',
  ];

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
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.search, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.message, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
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
          _buildTopNavigation(),
          const Divider(height: 1),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(6, (index) {
          final icons = [
            Icons.home,
            Icons.tv,
            Icons.people,
            Icons.store,
            Icons.notifications,
            Icons.menu
          ];
          return IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            icon: Icon(
              icons[index],
              size: 26,
              color: _selectedIndex == index ? const Color(0xFF1877F2) : Colors.grey,
            ),
          );
        }),
      ),
    );
  }

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
          // Create post box
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/a.jpg')),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.photo, color: Colors.green),
              ],
            ),
          ),
          const Divider(thickness: 8),

          // Stories
          Container(
            color: Colors.white,
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: [
                const StoryCard(image: "", isCreateStory: true),
                ...storyImages.map((img) => StoryCard(image: img)).toList(),
              ],
            ),
          ),
          const Divider(thickness: 8),

          // Demo Posts
          const PostCard(
            userName: "John Doe",
            userImage: "assets/a.jpg",
            text: "Hello Facebook! This is a demo post.",
            postImage: "assets/a.jpg",
          ),
          const PostCard(
            userName: "Jane Smith",
            userImage: "assets/a.jpg",
            text: "Flutter is amazing! Here's another demo post.",
          ),
        ],
      ),
    );
  }
}
