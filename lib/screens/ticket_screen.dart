import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/ticket.dart';
import 'package:flutter_application/screens/events_feed_screen.dart';
import 'package:flutter_application/widgets/ticket_decoration.dart';
import 'package:share_plus/share_plus.dart';

class TicketScreen extends StatelessWidget {
  final Ticket ticket;

  const TicketScreen({super.key, required this.ticket});

  void _onImagePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TicketImageDialog(imageUrl: ticket.imageUrl),
    );
  }

  void _onQrCodePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TicketQrCodeDialog(ticketId: ticket.id, title: ticket.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D1F1F),
        title: const Text(
          'Tickets',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EventsFeedScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              Share.share('Check out my ticket: ${ticket.title}');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main ticket content
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 100.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    ticket.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${ticket.title} : ${ticket.location}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const DottedLine(
                            dashColor: Colors.grey,
                            lineThickness: 1.5,
                            margin: EdgeInsets.symmetric(vertical: 20),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date", style: TextStyle(color: Colors.grey[600])),
                                  Text(ticket.date,
                                      style: const TextStyle(color: Colors.black87, fontSize: 16)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Time", style: TextStyle(color: Colors.grey[600])),
                                  Text(ticket.time,
                                      style: const TextStyle(color: Colors.black87, fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Venue", style: TextStyle(color: Colors.grey[600])),
                                  Text(
                                      ticket.venue,
                                      style: const TextStyle(color: Colors.black87, fontSize: 16)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Seat", style: TextStyle(color: Colors.grey[600])),
                                  Text(ticket.seat,
                                      style: const TextStyle(color: Colors.black87, fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                          const DottedLine(
                            dashColor: Colors.grey,
                            lineThickness: 1.5,
                            margin: EdgeInsets.symmetric(vertical: 30),
                          ),
                          const SizedBox(height: 0),
                          Center(
                            child: Center(
                              child: TicketBarcode(
                                barcode: Barcode.code128(),
                                data: ticket.id,
                              ),
                            ),
                          ),
                          const DottedLine(
                            dashColor: Colors.white,
                            lineThickness: 1.5,
                            margin: EdgeInsets.symmetric(vertical: 0),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 220,
                      left: -10,
                      child: Cutout(),
                    ),
                    const Positioned(
                      bottom: -10,
                      left: -10,
                      child: Cutout(),
                    ),
                    const Positioned(
                      top: 220,
                      right: -10,
                      child: Cutout(),
                    ),
                    const Positioned(
                      bottom: -10,
                      right: -10,
                      child: Cutout(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Floating buttons at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: FloatingButtons(
                onImagePressed: () => _onImagePressed(context),
                onQrCodePressed: () => _onQrCodePressed(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
