import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Background Abu Muda
      body: Stack(
        children: [
          // ==========================================
          // 1. KONTEN UTAMA (BISA DI-SCROLL)
          // ==========================================
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              120,
            ), // Bawah dikasih jarak buat Navbar
            child: Column(
              children: [
                const SizedBox(height: 50), // Jarak untuk Status Bar
                // --- HEADER SECTION ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ready to run?',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors
                                .black, // Warna teks hitam (karena background putih/abu)
                          ),
                        ),
                        // Garis biru di atas (hiasan header dari desain Mas)
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00D7FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    // Profile Picture
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://placehold.co/50x50",
                          ), // Ganti dengan foto asli
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // --- SHOE SELECTOR (KOTAK SEPATU) ---
                // Sesuai gambar screenshot Mas
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildShoeIcon(Icons.directions_run, true), // Aktif
                      _buildShoeIcon(Icons.directions_run, false),
                      _buildShoeIcon(Icons.directions_run, false),
                      _buildShoeIcon(Icons.directions_run, false),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- TOTAL DISTANCE ---
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Distance',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '100 Km',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- GRID PACE & CALORIES ---
                Row(
                  children: [
                    // Kotak Kiri (Pace)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Average Pace',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '6:30 /km',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Kotak Kanan (Calories)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Calories',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '200 kcal',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // --- LAST ACTIVITY ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Last Activity',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'January 23, 2026',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- PETA (MAP) ---
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                    image: const DecorationImage(
                      // Placeholder Peta (Ganti dengan Google Maps nanti)
                      image: NetworkImage(
                        "https://placehold.co/372x325/png?text=Map+View",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Surakarta",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==========================================
          // 2. BOTTOM NAVIGATION BAR (FLOATING)
          // ==========================================
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home_filled, size: 30),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.black),
                    ),
                    child: const Icon(Icons.circle, size: 20), // Icon Record
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, size: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person, size: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Kecil untuk Ikon Sepatu
  Widget _buildShoeIcon(IconData icon, bool isActive) {
    return Icon(
      icon,
      size: 30,
      color: isActive ? Colors.black : Colors.grey[300],
    );
  }
}
