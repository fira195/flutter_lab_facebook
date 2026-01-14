import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

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
            children: const [
              CircleAvatar(backgroundImage: AssetImage('assets/a.png')),
              SizedBox(width: 8),
              Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Post text
          const Text("This is a demo post. Click like or add comments!"),
          const SizedBox(height: 10),

          // Image (optional)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/music-bot.png'),
          ),

          const SizedBox(height: 10),
          const Divider(),

          // Actions: Like & Comment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
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

          // Comment section
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
            // Display comments
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
