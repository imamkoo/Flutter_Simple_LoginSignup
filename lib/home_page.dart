import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'profile',
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      // Aksi ketika profil ditekan
                      // Tambahkan logika untuk menampilkan profil pengguna
                      Navigator.pop(context);
                    },
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      _logout(context);
                    },
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(
                'assets/image1.PNG',
                width: 40,
                height: 40,
              ),
              title: Text('Iphone 13 pro'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp 15.000.000'),
                ],
              ),
              onTap: () {
                _showImagePopup(context, 'image1.PNG',
                    'iPhone 13 Pro - Kamera canggih, layar OLED tajam, prosesor cepat, desain premium.');
              },
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  _showConfirmationDialog(context, 'iPhone 13 Pro');
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(
                'assets/image2.PNG',
                width: 40,
                height: 40,
              ),
              title: Text('Iphone 14 Promax'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp 18.000.000'),
                ],
              ),
              onTap: () {
                _showImagePopup(context, 'image2.PNG',
                    'iPhone 14 Pro Max - Desain premium, kamera canggih, layar besar, performa canggih.');
              },
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  _showConfirmationDialog(context, 'iPhone 14 Pro Max');
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(
                'assets/image3.PNG',
                width: 40,
                height: 40,
              ),
              title: Text('Ipad Pro M1'),
              subtitle: Text('Rp 20.000.000'),
              onTap: () {
                _showImagePopup(context, 'image3.PNG',
                    'iPad Pro M1 - Performa tinggi, layar indah, dukungan Apple Pencil & Magic Keyboard.');
              },
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  _showConfirmationDialog(context, 'Ipad Pro M1');
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.white,
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _showConfirmationDialog(BuildContext context, String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Ingin menambahkan $productName ke dalam keranjang?'),
          actions: [
            TextButton(
              onPressed: () {
                // Aksi ketika tombol "Iya" ditekan
                // Tambahkan ke keranjang
                Navigator.of(context).pop();
              },
              child: Text('Iya'),
            ),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol "Tidak" ditekan
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  void _showImagePopup(
      BuildContext context, String imageName, String subtitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/$imageName',
                fit: BoxFit.contain,
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
