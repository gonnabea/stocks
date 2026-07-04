import 'package:flutter/material.dart';

class MarketStatusCard extends StatelessWidget {
  const MarketStatusCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff161F31),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green,
            child: Icon(Icons.trending_up),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("시장 상태"),

                SizedBox(height: 6),

                Text(
                  "상승 추세",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("76점"),
          )
        ],
      ),
    );
  }
}