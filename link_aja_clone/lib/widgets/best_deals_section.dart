import 'package:flutter/material.dart';
import 'dart:async';

class BestDealsSection extends StatefulWidget {
  const BestDealsSection({super.key});

  @override
  _BestDealsSectionState createState() => _BestDealsSectionState();
}

class _BestDealsSectionState extends State<BestDealsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;

  final List<Map<String, String>> _deals = [
    {
      "title": "Makin Mudah Beli Bright Gas!",
      "subtitle": "Gunakan LinkAja dan dapatkan promo up to 25 ribu!",
      "image": "assets/images/bestdeal1.jpg",
    },
    {
      "title": "Berkah Hingga Akhir 2023!",
      "subtitle": "Ayo beli BBM vi MyPERTAMINA. Ekstra Saldo s/d 15 ribu!",
      "image": "assets/images/bestdeal2.jpg",
    },
    {
      "title": "Lancar Mabar, Kantong Aman!",
      "subtitle": "Beli voucher games pakai LinkAja. Cash back s/d 20%!",
      "image": "assets/images/bestdeal3.png",
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
        int nextPage = (_currentPage + 1) % _deals.length;
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Best Deals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 209, 46, 46),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _deals.length,
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
                          image: AssetImage(_deals[index]["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _deals[index]["title"] ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _deals[index]["subtitle"] ?? '',
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
