import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendday_app/features/add_transactionscreen.dart';
import 'package:spendday_app/features/categories_section.dart';
import 'package:spendday_app/features/recent_activity.dart';
import 'package:spendday_app/features/spend_header.dart';
import 'package:spendday_app/features/total_spend_card.dart';

class SpendSummaryScreen extends StatelessWidget {
  const SpendSummaryScreen({super.key});

  static const Color _bg = Color(0xFF0D1B2A);
  static const Color _emerald = Color(0xFF2ECC8A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 16),
                        SpendHeader(),
                        SizedBox(height: 16),
                        TotalSpendCard(),
                        SizedBox(height: 24),
                        CategoriesSection(),
                        SizedBox(height: 24),
                        RecentActivitySection(),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Emerald FAB
            Positioned(
              bottom: 28,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const AddTransactionSheet(),
                  );
                },
                backgroundColor: _emerald,
                elevation: 8,
                shape: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.black, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
