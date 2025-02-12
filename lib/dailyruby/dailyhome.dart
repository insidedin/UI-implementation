import 'package:flutter/material.dart';

class DailyHome extends StatefulWidget {
  const DailyHome({super.key});

  @override
  State<DailyHome> createState() => _DailyHomeState();
}

class _DailyHomeState extends State<DailyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDE7F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.pink),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Balance and Actions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.qr_code, color: Colors.pink),
                          SizedBox(width: 8),
                          Text(
                            '1.000.000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(color: Colors.grey),
                      Row(
                        children: const [
                          Icon(Icons.monetization_on, color: Colors.pink),
                          SizedBox(width: 8),
                          Text(
                            '10',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(color: Colors.grey),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Transfer'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Promo Banner
                Stack(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://via.placeholder.com/300x150'), // Replace with real image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'SPECIAL!!! ALPHA SALON OPENING\nFREE MAKEUP AND FREE FACIAL MASSAGE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Categories
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: const [
                    CategoryButton(label: 'Alpha Clinic\nRegistration'),
                    CategoryButton(label: 'All Product'),
                    CategoryButton(label: 'Alpha Salon'),
                    CategoryButton(label: 'Alpha Slim\n(Coming Soon)'),
                    CategoryButton(label: 'Product\nRecommendation'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}