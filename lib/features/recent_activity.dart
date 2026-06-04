import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendday_app/provider/spend_provider.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  static const Color _cardBg = Color(0xFF152232);
  static const Color _emerald = Color(0xFF2ECC8A);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SpendProvider>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(Icons.tune, color: Colors.white54, size: 20),
          ],
        ),
        const SizedBox(height: 14),
        ...provider.transactions.map((tx) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: _cardBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3448),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(tx.icon, color: Colors.white70, size: 18),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${tx.date} • ${tx.category}',
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    tx.isIncome
                        ? '+\$${tx.amount.toStringAsFixed(2)}'
                        : '-\$${tx.amount.abs().toStringAsFixed(2)}',
                    style: TextStyle(
                      color: tx.isIncome ? _emerald : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
