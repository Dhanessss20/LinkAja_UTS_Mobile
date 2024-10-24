import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/header.dart';
import '../widgets/balance_card.dart';
import '../widgets/action_box.dart';
import '../widgets/feature_grid.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/best_deals_section.dart';
import '../widgets/latest_updates_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image that scrolls with content
            Stack(
              children: [
                // Gambar latar belakang
                Container(
                  height: 150, // Tinggi gambar latar
                  child: Image.asset(
                    'assets/images/kota.png', // Ganti dengan gambar latar Anda
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                // Konten di atas gambar (Header dan BalanceCard)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header di atas gambar
                      const Header(),
                      const SizedBox(height: 16.0),
                      // BalanceCard di atas gambar
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 192, 18, 18),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Dhaneswara Haryo Satriagung',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                Flexible(
                                  child: BalanceCard(
                                    title: 'Your Balance',
                                    amount: 'Rp 10.000.000',
                                    icon: FontAwesomeIcons.arrowRight,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Flexible(
                                  child: BalanceCard(
                                    title: 'Bonus Balance',
                                    amount: '0',
                                    icon: FontAwesomeIcons.arrowRight,
                                    leadingIcon: FontAwesomeIcons.gift,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Konten lain di bawah gambar
            const SizedBox(height: 8.0),
            const ActionBox(),
            const SizedBox(height: 8.0),
            const FeatureGrid(),
            const SizedBox(height: 8.0),
            const CarouselWidget(),
            const SizedBox(height: 8.0),
            const BestDealsSection(),
            const SizedBox(height: 8.0),
            const LatestUpdatesSection(),
          ],
        ),
      ),
    );
  }
}
