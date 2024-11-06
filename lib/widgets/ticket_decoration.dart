import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class DottedLine extends StatelessWidget {
  final Color dashColor;
  final double lineThickness;
  final EdgeInsets margin;

  const DottedLine({
    super.key,
    required this.dashColor,
    required this.lineThickness,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              (constraints.constrainWidth() / 10).floor(),
              (index) => Container(
                width: 5,
                height: lineThickness,
                color: dashColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Cutout extends StatelessWidget {
  const Cutout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF3D1F1F),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF3D1F1F), width: 10),
      ),
    );
  }
}

class TicketBarcode extends StatelessWidget {
  final Barcode barcode;
  final String data;

  const TicketBarcode({
    super.key,
    required this.barcode,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain, // Agar barcode menyesuaikan ukuran container luar
      child: BarcodeWidget(
        barcode: barcode,
        data: data,
        color: Colors.black,
      ),
    );
  }
}

// lib/widgets/ticket_decoration.dart
class FloatingButtons extends StatelessWidget {
  final VoidCallback onImagePressed;
  final VoidCallback onQrCodePressed;

  const FloatingButtons({
    super.key,
    required this.onImagePressed,
    required this.onQrCodePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            onPressed: onImagePressed,
            icon: const Icon(Icons.image),
            label: const Text("Image"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: onQrCodePressed,
            icon: const Icon(Icons.qr_code),
            label: const Text("QR Code"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.brown[900],
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// untuk menampilkan qr qode
class TicketQrCodeDialog extends StatelessWidget {
  final String ticketId;
  final String title;

  const TicketQrCodeDialog({super.key, required this.ticketId, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('QR Code for $title'),
      content: SizedBox(
        width: 200,
        height: 200,
        child: BarcodeWidget(
          barcode: Barcode.qrCode(),
          data: ticketId,
          width: 200,
          height: 200,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class TicketImageDialog extends StatelessWidget {
  final String imageUrl;

  const TicketImageDialog({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ticket Image'),
      content: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}