// lib/screens/video_screen.dart
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3D1F1F),
        elevation: 1,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF3D1F1F), // Matching ProfileScreen background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library,
              color: Colors.grey[300],
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "No Videos Available",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Looks like you haven’t uploaded any videos yet. Tap below to get started!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Feature to upload or browse videos coming soon!")),
                );
              },
              icon: const Icon(Icons.upload, size: 18, color: Colors.white),
              label: const Text("Upload Video"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white, // Set text color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                // Action for browsing videos
              },
              child: const Text(
                "Browse Videos",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
