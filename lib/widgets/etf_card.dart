import 'package:flutter/material.dart';
import '../models/etf.dart';

class EtfCard extends StatelessWidget {

  final Etf etf;

  const EtfCard({
    super.key,
    required this.etf,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xff161F31),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [

          Text(
            etf.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            "+${etf.profit.toStringAsFixed(1)}%",
            style: const TextStyle(color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}