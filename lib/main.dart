import 'package:flutter/material.dart';

void main() => runApp(MyBankApp());

class MyBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Bank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBankHomePage(),
    );
  }
}

class MyBankHomePage extends StatefulWidget {
  @override
  _MyBankHomePageState createState() => _MyBankHomePageState();
}

class _MyBankHomePageState extends State<MyBankHomePage> {
  TextEditingController _saldoController = TextEditingController();
  TextEditingController _transferController = TextEditingController();

  double saldo = 10000000.0; // Inisialisasi saldo awal
  bool showSaldo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Bank'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                       CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.account_balance,
                size: 50,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),
            Text(
              'Selamat datang di Smart Bank!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menampilkan saldo atau aktivitas transaksi di sini
                showDialog(
                context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Saldo Anda'),
                      content: Text('Rp. $saldo'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Lihat Saldo'),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menampilkan halaman transfer atau pembayaran di sini
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Transfer'),
                      content: Column(
                        children: [
                          TextField(
                            controller: _transferController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Jumlah Transfer'),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tambahkan logika untuk melakukan transfer di sini
                              double transferAmount = double.tryParse(_transferController.text) ?? 0.0;
                              if (transferAmount > 0 && transferAmount <= saldo) {
                                saldo -= transferAmount;
                                Navigator.of(context).pop();
                                // Tambahkan logika untuk menampilkan konfirmasi transfer atau yang lainnya
                              } else {
                                // Tambahkan logika untuk menampilkan pesan kesalahan
                              }
                            },
                            child: Text('Transfer'),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Transfer'),
            ),
            SizedBox(height: 20), // Jarak antara tombol
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menambah saldo di sini
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Tambah Saldo'),
                      content: Column(
                        children: [
                          TextField(
                            controller: _saldoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Jumlah Saldo'),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tambahkan logika untuk menambah saldo di sini
                              double saldoToAdd = double.tryParse(_saldoController.text) ?? 0.0;
                              if (saldoToAdd > 0) {
                                saldo += saldoToAdd;
                                Navigator.of(context).pop();
                                // Tambahkan logika untuk menampilkan konfirmasi penambahan saldo atau yang lainnya
                              } else {
                                // Tambahkan logika untuk menampilkan pesan kesalahan
                              }
                            },
                            child: Text('Tambah Saldo'),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Batal'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Tambah Saldo'),
            ),
          ],
        ),
      ),
    );
  }
}