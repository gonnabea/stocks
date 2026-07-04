import 'package:flutter/material.dart';

import '../models/etf.dart';
import '../models/sector.dart';

import '../widgets/market_status_card.dart';
import '../widgets/sector_card.dart';
import '../widgets/etf_card.dart';

class SectorPage extends StatelessWidget {
  const SectorPage({super.key});

  @override
  Widget build(BuildContext context) {

    final sectors = [

      Sector(
          name: "반도체",
          percent: 35.2,
          color: Colors.deepPurple),

      Sector(
          name: "소프트웨어",
          percent: 28.7,
          color: Colors.blue),

      Sector(
          name: "우주항공",
          percent: 21.3,
          color: Colors.orange),

      Sector(
          name: "금",
          percent: 14.6,
          color: Colors.amber),

      Sector(
          name: "헬스케어",
          percent: 10.2,
          color: Colors.green),
    ];

    final etfs = [

      Etf(name: "SOXL", profit: 35.6),
      Etf(name: "TECL", profit: 29.1),
      Etf(name: "IGV", profit: 28.3),
      Etf(name: "SPMO", profit: 18.6),

    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("주도 섹터"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const MarketStatusCard(),

            const SizedBox(height: 24),

            const Text(
              "섹터 랭킹",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ...List.generate(
              sectors.length,
              (index) => SectorCard(
                rank: index + 1,
                sector: sectors[index],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "관련 ETF",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: etfs
                  .map((e) => EtfCard(etf: e))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}