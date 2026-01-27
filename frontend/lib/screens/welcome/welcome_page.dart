import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = size.width / 430;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Stack(
        children: [
          // ==========================================
          // LAYER 1: BACKGROUND (MANUAL SCALING)
          // ==========================================
          // Tanpa FittedBox, kita posisikan manual dengan pengali 'scale'.
          // Ini DIJAMIN presisi dan Full Width di semua layar.
          
          // Shape 1 (Hijau Gelap)
          Positioned(
            left: 274.34 * scale,  // Posisi X dikali scale
            top: -98 * scale,      // Posisi Y dikali scale
            child: _buildShape(
              size.width * 2,      // Lebar SUPER PANJANG (Aman 100%)
              77.78 * scale,       // Tinggi dikali scale
              const Color(0xFF005461),
              scale,               // Kirim scale untuk radius
            ),
          ),
          
          // Shape 2 (Hijau Medium)
          Positioned(
            left: 190.15 * scale,
            top: -57 * scale,
            child: _buildShape(
              size.width * 2, 
              76.35 * scale, 
              const Color(0xFF0C7779),
              scale,
            ),
          ),
          
          // Shape 3 (Hijau Terang - Paling Besar)
          Positioned(
            left: -7.11 * scale,
            top: -93.36 * scale,
            child: _buildShape(
              size.width * 2, 
              82.15 * scale, 
              const Color(0xFF249E94),
              scale,
            ),
          ),

          // ==========================================
          // LAYER 2: KONTEN UTAMA (Teks & Tombol)
          // ==========================================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // Spacer dinamis agar gambar turunnya pas
                  const Spacer(flex: 5),

                  // Gambar Pelari
                  Image.asset(
                    'assets/images/runner.png',
                    width: size.width * 0.55,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.directions_run, size: 120),
                  ),

                  const Spacer(flex: 2),

                  // Teks
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 32, // Bisa dikali scale juga jika mau teks membesar di tablet
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Make a move, Down here!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const Spacer(flex: 4),

                  // Tombol (Ukuran Fixed sesuai request W:344)
                  Column(
                    children: [
                      _buildButton("Sign In", () {}),
                      const SizedBox(height: 15),
                      _buildButton("Sign Up", () {}),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Footer
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Continue without account',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Button
  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 344, // Fixed Width sesuai Figma
      height: 50, // Fixed Height sesuai Figma
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(width: 1.5, color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          foregroundColor: Colors.black,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Helper Shape Update (Menerima Scale untuk Radius)
  Widget _buildShape(double width, double height, Color color, double scale) {
    return Container(
      // Rotasi tetap sama (0.49 rad)
      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.49),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          // Radius juga harus discale agar proporsional di tablet
          borderRadius: BorderRadius.circular(50 * scale), 
        ),
      ),
    );
  }
}