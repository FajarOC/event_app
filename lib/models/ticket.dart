// lib/models/ticket.dart

class Ticket {
  final String id;
  final String title;
  final String location;
  final String time;
  final String date;
  final String seat;
  final String price;
  final String imageUrl;
  final String venue;
  final String about;// Tambahkan ini
  final List<String> description; // Tambahkan ini
  final int rating;

  Ticket({
    required this.id,
    required this.title,
    required this.location,
    required this.time,
    required this.date,
    required this.seat,
    required this.price,
    required this.imageUrl,
    required this.venue,
    required this.about,
    required this.description,
    required this.rating,
  });
}