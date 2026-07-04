import 'package:flutter/material.dart';
import '../models/sector.dart';

class SectorCard extends StatelessWidget {

  final int rank;
  final Sector sector;

  const SectorCard({
    super.key,
    required this.rank,
    required this.sector,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff161F31),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: sector.color,
            child: Text("$rank"),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              sector.name,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          Text(
            "+${sector.percent.toStringAsFixed(1)}%",
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}