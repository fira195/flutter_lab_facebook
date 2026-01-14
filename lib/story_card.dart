import 'package:flutter/material.dart';

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
        image: !isCreateStory
            ? DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
            : null,
        color: isCreateStory ? Colors.grey.shade300 : null,
      ),
      child: Stack(
        children: [
          if (isCreateStory)
            Positioned(
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
