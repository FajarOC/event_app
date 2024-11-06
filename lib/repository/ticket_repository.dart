// lib/repository/ticket_repository.dart
import '../models/ticket.dart';

class TicketRepository {
  static List<Ticket> getTickets() {
    return [
      Ticket(
        id: "8952290123",
        title: "Oliver sykes",
        location: "Jakarta, Ina",
        venue: "Gelora Bung Karno",
        time: "10:00 PM",
        date: "Dec 29, 2022",
        seat: "19",
        price: "\$45.90",
        imageUrl: 'assets/oliver_sykes.jpg',
        about: 'When the concert Oliver sykes will be on stage in 10:00 PM. List of songs: Forget It, When I\'m Down, All That and Life Goes On.',
        description: [
          'Oliver Sykes concert is on Dec 29nd at 10:00 PM',
          'Special guest performances before main act',
          'Event located at Stadion Gelora Bung Karno',
        ],
        rating: 4,
      ),
      Ticket(
        id: "8952290124",
        title: "Juicy Lucy",
        location: "Pekalongan, Ina",
        venue: "Kajen Square",
        time: "07:00 PM",
        date: "August 20, 2024",
        seat: "28",
        price: "\$75.00",
        imageUrl: 'assets/Juicy.jpeg',
        about: 'When the concert Juicy Lucy will be on stage in 07:00 PM. List of songs: Forget It, When I\'m Down, All That and Life Goes On.',
        description: [
          'Juicy Lucy concert is on August 20nd at 07:00 PM',
          'Special guest performances before main act',
          'Event located at Kajen Square',
        ],
        rating: 4,
      ),
      Ticket(
        id: "8952290125",
        title: "Imagine Dragons",
        location: "Bandung, Ina",
        venue: "Bandung Convention Center",
        time: "08:00 PM",
        date: "Mar 22, 2023",
        seat: "72",
        price: "\$90.02",
        imageUrl: 'assets/konser1.jpeg',
        about: 'When the concert Imagine Dragons will be on stage in 08:00 PM. List of songs: Forget It, When I\'m Down, All That and Life Goes On.',
        description: [
          'Imagine Dragons concert is on Mar 22nd at 08:00 PM',
          'Special guest performances before main act',
          'Event located at Bandung Convention Center',
        ],
        rating: 4,
      ),
      Ticket(
        id: "8952290126",
        title: "The Cangcuters",
        location: "Semarang, Ina",
        venue: "Sam poo kong",
        time: "08:00 PM",
        date: "June 12, 2023",
        seat: "32",
        price: "\$30.02",
        imageUrl: 'assets/cangcuters.jpg',
        about: 'When the concert The Cangcuters will be on stage in 08:00 PM. List of songs: Forget It, When I\'m Down, All That and Life Goes On.',
        description: [
          'IThe Cangcuters concert is on June 12nd at 08:00 PM',
          'Special guest performances before main act',
          'Event located at Sam poo kong',
        ],
        rating: 5,
      ),
    ];
  }
}
