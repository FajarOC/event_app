// lib/screens/inbox_screen.dart
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color(0xFF3D1F1F),
      ),
      backgroundColor: const Color(0xFF3D1F1F), // Matches ProfileScreen background
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessageTile(
            message: message,
          );
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String subject;
  final String preview;
  final String timestamp;

  Message({
    required this.sender,
    required this.subject,
    required this.preview,
    required this.timestamp,
  });
}

// List of sample messages for demonstration purposes
final List<Message> messages = [
  Message(
    sender: "Admin",
    subject: "Welcome to Event App",
    preview: "Hello! We're excited to have you onboard...",
    timestamp: "10:30 AM",
  ),
  Message(
    sender: "Event Organizer",
    subject: "New Event: The cangcuter Meetup",
    preview: "Join us this Friday for an exciting  The cangcuter Meetup.",
    timestamp: "Yesterday",
  ),
  Message(
    sender: "Support",
    subject: "Account Update",
    preview: "Your account settings have been updated...",
    timestamp: "2 days ago",
  ),
  // Add more sample messages if needed
];

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF4B2C2C), // Consistent dark card background
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Text(
            message.sender[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          message.sender,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.subject,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.preview,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message.timestamp,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Opening message from ${message.sender}"),
            ),
          );
        },
      ),
    );
  }
}
