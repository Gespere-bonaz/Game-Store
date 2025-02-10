import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.track_changes_outlined,
      'color': const Color(0xFF5F67EA),
      'title': 'Arcade',
    },
    {
      'icon': Icons.sports_motorsports_outlined,
      'color': const Color(0xFFFC77A6),
      'title': 'Racing',
    },
    {
      'icon': Icons.casino_outlined,
      'color': const Color(0xFF4391FF),
      'title': 'Strategy',
    },
    {
      'icon': Icons.sports_esports,
      'color': const Color(0xFF7182F2),
      'title': 'More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: categories[index]['color'] as Color,
                    ),
                    child: Icon(
                      categories[index]['icon'] as IconData,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index]['title'] as String,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
