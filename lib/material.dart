import 'package:flutter/material.dart';

class User {
  String name;
  double balance;
  List<Transaction> transactionHistory;

  User({required this.name, this.balance = 0.0})
      : transactionHistory = [];

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactionHistory.add(Transaction(type: 'Deposit', amount: amount));
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      transactionHistory.add(Transaction(type: 'Withdrawal', amount: amount));
    }
  }

  void printTransactionHistory() {
    print('Transaction History for $name:');
    for (Transaction transaction in transactionHistory) {
      print(transaction);
    }
  }

  @override
  String toString() {
    return 'User: $name, Balance: \$${balance.toStringAsFixed(2)}';
  }
}

class Transaction {
  String type;
  double amount;
  DateTime date;

  Transaction({required this.type, required this.amount})
      : date = DateTime.now();

  @override
  String toString() {
    return '$type - Amount: \$${amount.toStringAsFixed(2)}, Date: $date';
  }
}

class BankApp extends StatelessWidget {
  final Bank bank;

  BankApp({required this.bank});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Banking App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  User? user = bank.findUser('Alice');
                  if (user != null) {
                    user.deposit(100.0);
                    user.withdraw(50.0);
                    user.printTransactionHistory();
                    print(user);
                  }
                },
                child: Text('Make Transactions for Alice'),
              ),
              ElevatedButton(
                onPressed: () {
                  User? user = bank.findUser('Bob');
                  if (user != null) {
                    user.deposit(200.0);
                    user.printTransactionHistory();
                    print(user);
                  }
                },
                child: Text('Make Transactions for Bob'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bank {
  List<User> users;

  Bank({required this.users});

  User? findUser(String name) {
    for (User user in users) {
      if (user.name == name) {
        return user;
      }
    }
    return null;
  }
}

void main() {
  runApp(BankApp(bank: Bank(users: [User(name: 'Alice'), User(name: 'Bob')])));
}