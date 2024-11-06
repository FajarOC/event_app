// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import '../models/ticket.dart';
import '../widgets/event_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Ticket> favoriteTickets;

  const FavoritesScreen({super.key, required this.favoriteTickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Favorites",
          style: TextStyle(color: Colors.white), // Make the text color white
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3D1F1F),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3D1F1F), Color(0xFF3D1F1F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: favoriteTickets.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "No favorites yet.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: favoriteTickets.length,
                itemBuilder: (context, index) {
                  final ticket = favoriteTickets[index];
                  return Dismissible(
                    key: ValueKey(ticket.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      color: Colors.redAccent,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: FadeTransition(
                      opacity: const AlwaysStoppedAnimation(1.0),
                      child: EventCard(
                        ticket: ticket,
                        isFavorite: true,
                        onFavoriteToggle: (_) {
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
