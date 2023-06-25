import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  late final String username;

  ProfilePage({required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo,',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.username,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Ubah Username',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveUsername();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveUsername() {
    String newUsername = _usernameController.text;
    // Lakukan validasi atau operasi lainnya sebelum menyimpan username
    if (newUsername.isNotEmpty) {
      setState(() {
        widget.username = newUsername;
      });
      // Simpan username yang diubah
      // Lakukan sesuatu dengan username yang baru
      // ...
      // Tampilkan snackbar atau pesan berhasil disimpan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username berhasil disimpan.'),
        ),
      );
    } else {
      // Tampilkan pesan kesalahan jika username kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username tidak boleh kosong.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
