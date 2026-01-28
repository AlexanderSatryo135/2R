import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0096FF), // Background Biru (Header)
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // ==========================================
            // 1. DEKORASI HEADER (Shape Ungu)
            // ==========================================
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 215,
                height: 128,
                decoration: const ShapeDecoration(
                  color: Color(0xFF5800FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                ),
              ),
            ),

            // ==========================================
            // 2. KARTU PUTIH UTAMA
            // ==========================================
            Positioned(
              top: 185, // Posisi sesuai Figma
              left: 0,
              right: 0,
              bottom: 0, // Mentok sampai bawah
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60), // Radius besar 60
                      topRight: Radius.circular(60),
                    ),
                  ),
                ),
                // Agar konten bisa discroll
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 40), // Jarak dari lengkungan atas
                      
                      // JUDUL
                      Text(
                        'Sign Up!',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      const SizedBox(height: 10),

                      // SUBJUDUL
                      Text(
                        'Create a new account in order \nto Sign In later!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 50),

                      // INPUT FORMS (Pill Shape)
                      _buildPillTextField(hint: "Email"),
                      const SizedBox(height: 20),
                      _buildPillTextField(hint: "Username"),
                      const SizedBox(height: 20),
                      _buildPillTextField(hint: "Password", isPassword: true),

                      const SizedBox(height: 40),

                      // TOMBOL SIGN UP
                      SizedBox(
                        width: double.infinity,
                        height: 54, // Tinggi sesuai Figma
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika Sign Up nanti di sini
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D7FF), // Warna Cyan
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60), // Radius 60
                              side: const BorderSide(width: 1),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50), // Spacer ke bawah

                      // FOOTER (Link balik ke Login)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Kembali ke halaman Login
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 40), // Padding bawah tambahan
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk membuat Input Oval (Pill Shape)
  Widget _buildPillTextField({required String hint, bool isPassword = false}) {
    return Container(
      height: 54, // Tinggi Fixed sesuai Figma
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60), // Radius 60 agar oval sempurna
        border: Border.all(width: 1, color: Colors.black), // Border hitam tipis
      ),
      child: Center(
        child: TextField(
          obscureText: isPassword,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFFC2C2C2), // Warna abu-abu teks placeholder
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            border: InputBorder.none, // Hilangkan garis bawah default
          ),
        ),
      ),
    );
  }
}