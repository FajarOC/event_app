// lib/screens/events_feed_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application/repository/ticket_repository.dart';
import '../models/ticket.dart';
import '../widgets/event_card.dart';
import '../screens/favorites_screen.dart';
import '../screens/video_screen.dart';
import '../screens/inbox_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/custom_navbar.dart';

class EventsFeedScreen extends StatefulWidget {
  const EventsFeedScreen({super.key});

  @override
  _EventsFeedScreenState createState() => _EventsFeedScreenState();
}

class _EventsFeedScreenState extends State<EventsFeedScreen> {
  final List<Ticket> allTickets = TicketRepository.getTickets();
  List<Ticket> filteredTickets = [];
  List<Ticket> favoriteTickets = [];
  int _currentIndex = 0;
  String selectedCategory = 'My feed';
  String searchQuery = ""; // State untuk search query

  void toggleFavorite(Ticket ticket) {
    setState(() {
      if (favoriteTickets.contains(ticket)) {
        favoriteTickets.remove(ticket);
      } else {
        favoriteTickets.add(ticket);
      }
    });
  }

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    filteredTickets = allTickets; // Set awal
    _screens = [
      buildEventsFeed(),
      FavoritesScreen(favoriteTickets: favoriteTickets),
      const VideoScreen(),
      const InboxScreen(),
      const ProfileScreen(),
    ];
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      // Filter tickets berdasarkan query
      filteredTickets = allTickets
          .where((ticket) => ticket.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D1F1F),
      appBar: _currentIndex == 0
          ? AppBar(
              backgroundColor: const Color(0xFF3D1F1F),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu_sharp, color: Colors.white),
                onPressed: () {},
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  Text(
                    'Jakarta, Ina',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
            icon: const Icon(Icons.person, color: Colors.white), // Ubah ikon menjadi ikon orang
            onPressed: () {},
                ),
              ],
            )
          : null, // AppBar is hidden when _currentIndex is not 0
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildEventsFeed() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TextField(
            onChanged: updateSearchQuery, // Memanggil fungsi updateSearchQuery saat teks berubah
            decoration: InputDecoration(
              hintText: 'Search all events...',
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: Colors.brown[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CategoryChips(
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Upcoming events',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTickets.length,
              itemBuilder: (context, index) {
                Ticket ticket = filteredTickets[index];
                return EventCard(
                  ticket: ticket,
                  isFavorite: favoriteTickets.contains(ticket),
                  onFavoriteToggle: toggleFavorite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
