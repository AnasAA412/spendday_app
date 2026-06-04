import 'package:flutter/material.dart';

class Transaction {
  final String name;
  final String date;
  final String category;
  final double amount;
  final IconData icon;

  const Transaction({
    required this.name,
    required this.date,
    required this.category,
    required this.amount,
    required this.icon,
  });

  bool get isIncome => amount > 0;
}

class Category {
  final String name;
  final double amount;
  final IconData icon;

  Category({required this.name, required this.amount, required this.icon});
}

class SpendProvider extends ChangeNotifier {
  final List<String> months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER',
  ];
  String month = 'JUNE';
  double monthlyBudget = 0;
  double percentVsLastMonth = 0;

  static const Map<String, String> _monthMap = {
    'JANUARY': 'Jan',
    'FEBRUARY': 'Feb',
    'MARCH': 'Mar',
    'APRIL': 'Apr',
    'MAY': 'May',
    'JUNE': 'Jun',
    'JULY': 'Jul',
    'AUGUST': 'Aug',
    'SEPTEMBER': 'Sep',
    'OCTOBER': 'Oct',
    'NOVEMBER': 'Nov',
    'DECEMBER': 'Dec',
  };

  final List<Transaction> _allTransactions = [
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
    Transaction(
      name: 'Starbucks',
      date: 'Jun 24, 2023',
      category: 'Food',
      amount: -12.50,
      icon: Icons.local_cafe,
    ),
    Transaction(
      name: 'Delta Airlines',
      date: 'Jun 22, 2023',
      category: 'Travel',
      amount: -480.00,
      icon: Icons.flight,
    ),
    Transaction(
      name: 'Amazon',
      date: 'Jun 20, 2023',
      category: 'Shopping',
      amount: -89.99,
      icon: Icons.shopping_cart_outlined,
    ),
    Transaction(
      name: 'Utility Bill',
      date: 'Jun 18, 2023',
      category: 'Bills',
      amount: -154.20,
      icon: Icons.bolt,
    ),
    Transaction(
      name: 'Salary Deposit',
      date: 'Jun 15, 2023',
      category: 'Income',
      amount: 4200.00,
      icon: Icons.account_balance_wallet,
    ),
    Transaction(
      name: 'Uber Trip',
      date: 'Jun 14, 2023',
      category: 'Travel',
      amount: -22.40,
      icon: Icons.directions_car,
    ),
    Transaction(
      name: 'Netflix',
      date: 'Jun 12, 2023',
      category: 'Entertainment',
      amount: -15.99,
      icon: Icons.movie_outlined,
    ),
  ];

  List<Transaction> get transactions {
    final prefix = _monthMap[month.toUpperCase()];
    if (prefix == null) return _allTransactions;
    return _allTransactions.where((tx) => tx.date.startsWith(prefix)).toList();
  }

  double get totalSpend {
    return transactions
        .where((tx) => !tx.isIncome)
        .fold(0.0, (sum, tx) => sum + tx.amount.abs());
  }

  double get budgetUsedPercent {
    if (monthlyBudget <= 0) return 0.0;
    return (totalSpend / monthlyBudget).clamp(0.0, 1.0);
  }

  final List<Category> _defaultCategories = [
    Category(name: 'Food', amount: 0, icon: Icons.restaurant),
    Category(name: 'Travel', amount: 0, icon: Icons.flight),
    Category(name: 'Shopping', amount: 0, icon: Icons.shopping_bag_outlined),
    Category(name: 'Bills', amount: 0, icon: Icons.bolt),
    Category(name: 'Income', amount: 0, icon: Icons.account_balance_wallet),
    Category(name: 'Entertainment', amount: 450, icon: Icons.movie_outlined),
    Category(name: 'Health', amount: 0, icon: Icons.favorite_border),
    Category(name: 'Other', amount: 0, icon: Icons.more_horiz),
  ];

  List<Category> get categories {
    return _defaultCategories.map((cat) {
      final categoryAmount = transactions
          .where((tx) => tx.category == cat.name && !tx.isIncome)
          .fold(0.0, (sum, tx) => sum + tx.amount.abs());

      // If it's Entertainment and we are in JULY and there are no other transactions, keep the default 450
      final displayAmount =
          (cat.name == 'Entertainment' &&
              categoryAmount == 0 &&
              month == 'JULY')
          ? 450.0
          : categoryAmount;

      return Category(name: cat.name, amount: displayAmount, icon: cat.icon);
    }).toList();
  }

  void setMonth(String newMonth) {
    if (months.contains(newMonth)) {
      month = newMonth;
      notifyListeners();
    }
  }

  static const Map<String, IconData> _categoryIcons = {
    'Food': Icons.restaurant,
    'Travel': Icons.flight,
    'Shopping': Icons.shopping_bag_outlined,
    'Bills': Icons.bolt,
    'Income': Icons.account_balance_wallet,
    'Entertainment': Icons.movie_outlined,
    'Health': Icons.favorite_border,
    'Other': Icons.more_horiz,
  };

  void addTransaction({
    required String name,
    required String date,
    required String category,
    required double amount,
  }) {
    final icon = _categoryIcons[category] ?? Icons.more_horiz;

    _allTransactions.insert(
      0,
      Transaction(
        name: name,
        date: date,
        category: category,
        amount: amount,
        icon: icon,
      ),
    );

    notifyListeners();
  }
}
