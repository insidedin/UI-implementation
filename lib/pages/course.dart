import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/widgets/widget.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  ///inisialisasi list item produk
  final List<Map<String, String>> produk = [
    {
      'gambar': 'assets/images/ms.jpg',
      'nama': 'Kursus Microsoft Office',
      'harga': 'Rp.600.000'
    },
    {
      'gambar': 'assets/images/desain.jpg',
      'nama': 'Kursus Desain Grafis',
      'harga': 'Rp.650.000'
    },
    {
      'gambar': 'assets/images/laravel.jpg',
      'nama': 'Kursus Framework Laravel',
      'harga': 'Rp.700.000'
    },
    {
      'gambar': 'assets/images/web.jpg',
      'nama': 'Kursus Desain Web',
      'harga': 'Rp.650.000'
    },
    {
      'gambar': 'assets/images/autocad.jpg',
      'nama': 'Kursus Autocad 3D',
      'harga': 'Rp.750.000'
    },
    {
      'gambar': 'assets/images/digital.jpg',
      'nama': 'Kursus Digital Marketing',
      'harga': 'Rp.550.000'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 2,

            ///memanggil list item produk untuk ditampilkan
            children: List.generate(produk.length, (index) {
              final item = produk[index];

              ///tampilan card item produk
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        item['gambar']!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 2),
                      child: textView(
                        EdgeInsets.only(top: 20, left: 10),
                        (item['nama']),
                        TextAlign.left,
                        Colors.black,
                        FontWeight.w500,
                        16,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: textView(
                    EdgeInsets.only(left: 10),
                    (item['harga']),
                    TextAlign.left,
                    Colors.black,
                    FontWeight.bold,
                    17,
                  ),),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
