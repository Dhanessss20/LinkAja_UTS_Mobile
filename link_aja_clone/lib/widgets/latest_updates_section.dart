import 'package:flutter/material.dart';
import 'dart:async';

class LatestUpdatesSection extends StatefulWidget {
  const LatestUpdatesSection({Key? key}) : super(key: key);

  @override
  _LatestUpdatesSectionState createState() => _LatestUpdatesSectionState();
}

class _LatestUpdatesSectionState extends State<LatestUpdatesSection> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;

  final List<Map<String, String>> _updates = [
    {
      "title": "Layanan Top Up & Update Saldo E-Money",
      "subtitle": "Pastikan LinkAja-mu sudah diupdate ke versi terbaru ya!",
      "image": "assets/images/update1.jpg", // Gambar pertama
    },
    {
      "title": "Gabung LinkAja Full-Service",
      "subtitle": "Nikmati beberapa keuntungannya dengan join LinkAja Full-Service!",
      "image": "assets/images/update2.jpg", // Gambar kedua
    },
    {
      "title": "Bisa Beli Pulsa dan Paket Data Telkomsel!",
      "subtitle": "Yuk cobain menu baru. Hemat Lengkap by TELKOMSEL di LinkAja!",
      "image": "assets/images/update3.jpg", // Gambar ketiga
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _updates.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Latest Updates",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _updates.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(_updates[index]["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _updates[index]["title"] ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _updates[index]["subtitle"] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
