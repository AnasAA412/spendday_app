import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendday_app/provider/spend_provider.dart';

class TotalSpendCard extends StatelessWidget {
  const TotalSpendCard({super.key});

  static const Color _cardBg = Color(0xFF152232);
  static const Color _emerald = Color(0xFF2ECC8A);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SpendProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL SPEND',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: provider.month,
                  dropdownColor: _cardBg,
                  icon: const Icon(Icons.arrow_drop_down, color: _emerald, size: 20),
                  isDense: true,
                  style: const TextStyle(
                    color: _emerald,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      provider.setMonth(newValue);
                    }
                  },
                  items: provider.months.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '\$${provider.totalSpend.toStringAsFixed(2)}',
            style: const TextStyle(
              color: _emerald,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF1A3A28),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('📈', style: TextStyle(fontSize: 13)),
                const SizedBox(width: 4),
                Text(
                  '+${provider.percentVsLastMonth.toStringAsFixed(0)}% vs last month',
                  style: const TextStyle(
                    color: _emerald,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Monthly Budget',
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
              Text(
                '${(provider.budgetUsedPercent * 100).toStringAsFixed(0)}% used',
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: provider.budgetUsedPercent,
              backgroundColor: const Color(0xFF1E3448),
              valueColor: const AlwaysStoppedAnimation<Color>(_emerald),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
