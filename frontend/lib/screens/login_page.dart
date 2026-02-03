import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_page.dart';
import 'home_page.dart'; // [BARU] Import halaman Home

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar agar responsif
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            // ===============================================
            // 1. HEADER (Background Biru & Ungu)
            // ===============================================

            // Latar Biru Atas
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(height: 250, color: const Color(0xFF0096FF)),
            ),

            // Bentuk Ungu (Kiri Atas)
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 215,
                height: 150,
                decoration: const ShapeDecoration(
                  color: Color(0xFF5800FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
              ),
            ),

            // ===============================================
            // 2. GAMBAR PELARI
            // ===============================================
            Positioned(
              top: 47 + MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/runner.png',
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.directions_run,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // ===============================================
            // 3. KARTU PUTIH (FORM LOGIN)
            // ===============================================
            Positioned(
              left: 0,
              right: 0,
              top: 200,
              bottom: 0,
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Judul
                      Text(
                        'Welcome!',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Make a move, Down here!',
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Input Username
                      _buildTextField(hint: "Username"),

                      const SizedBox(height: 15),

                      // Input Password
                      _buildTextField(hint: "Password", isPassword: true),

                      const SizedBox(height: 25),

                      // Tombol Sign In (Login)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika login nanti di sini
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D7FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(width: 1),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Divider "Or Sign In with"
                      Row(
                        children: [
                          const Expanded(child: Divider(color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or Sign In with',
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ),
                          const Expanded(child: Divider(color: Colors.black)),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // Logo Google Placeholder
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.g_mobiledata,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Footer Text: Sign Up (NAVIGASI DITAMBAHKAN DI SINI)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              // --- NAVIGASI KE SIGN UP PAGE ---
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700, // Bold
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 90),

                      // Footer Text: Continue without account
                      GestureDetector(
                        // [MODIFIKASI DI SINI]
                        onTap: () {
                          // Navigasi ke HomePage dan menghapus LoginPage dari back-stack
                          // Agar user tidak bisa kembali ke login saat tekan back
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'Continue without account',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
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

  // Widget Helper untuk Input Field
  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: const Color(0xFFC2C2C2)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Color(0xFF0096FF)),
          ),
        ),
      ),
    );
  }
}
