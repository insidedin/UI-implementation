void login() async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Wajib Diisi Semua!')),
    );
    return;
  }

  try {
    // Query ke Firestore untuk mencari pengguna dengan email dan password yang cocok
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (result.docs.isNotEmpty) {
      // Login berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Berhasil!')),
      );
      // Bisa navigate ke home atau simpan status login
    } else {
      // Tidak ditemukan pengguna dengan email dan password tersebut
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email atau Password salah')),
      );
    }
  } catch (e) {
    // Tangani error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Terjadi kesalahan: $e')),
    );
  }
}
