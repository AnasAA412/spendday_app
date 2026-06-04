import 'package:flutter/material.dart';

class SpendHeader extends StatelessWidget {
  const SpendHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.menu, color: Color(0xFF2ECC8A), size: 22),
            const SizedBox(width: 12),
            Text(
              'Spending Overview',
              style: TextStyle(
                color: const Color(0xFF2ECC8A),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFF1E3448),
          child: ClipOval(
            child: Image.network(
              'https://i.pravatar.cc/40',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.person, color: Colors.white54, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
