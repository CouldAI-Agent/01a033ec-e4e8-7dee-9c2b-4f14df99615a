import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poster Aman Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PosterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600, // Maximum width for good readability
            ),
            child: AspectRatio(
              aspectRatio: 21 / 29.7, // A4 ratio
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: const PosterContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PosterContent extends StatelessWidget {
  const PosterContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine sizing based on available width using LayoutBuilder
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double titleFontSize = width * 0.06;
        final double subtitleFontSize = width * 0.045;
        final double textFontSize = width * 0.035;
        final double smallTextFontSize = width * 0.025;
        
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            ),
          ),
          child: Stack(
            children: [
              // Decorative background circles
              Positioned(
                top: -width * 0.2,
                right: -width * 0.2,
                child: Container(
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -width * 0.1,
                left: -width * 0.1,
                child: Container(
                  width: width * 0.4,
                  height: width * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(0.1),
                  ),
                ),
              ),
              
              // Main Content
              Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Text(
                      'AMAN DIGITAL\nUNTUK ANAK USIA DINI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: width * 0.06),

                    // Pertanyaan Pemantik
                    Container(
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lightbulb, color: Colors.orange[800], size: subtitleFontSize * 1.5),
                              SizedBox(width: width * 0.02),
                              Expanded(
                                child: Text(
                                  'Tahukah Ayah Bunda?',
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[900],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: width * 0.02),
                          Text(
                            '"Apakah anak kita benar-benar aman saat menonton video atau bermain game di gawai mereka?"',
                            style: TextStyle(
                              fontSize: textFontSize,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.06),

                    // Fakta (Fact)
                    Container(
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.blue[700], size: subtitleFontSize),
                              SizedBox(width: width * 0.02),
                              Text(
                                'Fakta Mengejutkan:',
                                style: TextStyle(
                                  fontSize: subtitleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: width * 0.02),
                          Text(
                            'Lebih dari 50% anak usia dini sudah terpapar gawai, namun pengawasan orang tua seringkali kurang dari yang dibutuhkan untuk mencegah paparan konten tidak pantas atau risiko privasi.',
                            style: TextStyle(fontSize: textFontSize, color: Colors.black87),
                          ),
                          SizedBox(height: width * 0.01),
                          Text(
                            '*Sumber referensi: Laporan KPAI / Riset UNICEF tentang Anak di Dunia Digital',
                            style: TextStyle(
                              fontSize: smallTextFontSize,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.06),

                    // Edukasi / Tips (Education)
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green[300]!, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Langkah Pintar Orang Tua:',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: width * 0.03),
                            Expanded(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  _buildTipItem(
                                    icon: Icons.timer,
                                    color: Colors.purple,
                                    text: 'Batasi Waktu Layar (Screen Time) maksimal 1 jam/hari untuk anak usia 2-5 tahun.',
                                    fontSize: textFontSize,
                                    width: width,
                                  ),
                                  _buildTipItem(
                                    icon: Icons.family_restroom,
                                    color: Colors.teal,
                                    text: 'Dampingi anak saat bermain gawai. Jadilah fasilitator, bukan sekadar penonton.',
                                    fontSize: textFontSize,
                                    width: width,
                                  ),
                                  _buildTipItem(
                                    icon: Icons.security,
                                    color: Colors.red,
                                    text: 'Aktifkan fitur Parental Control (Kontrol Orang Tua) di aplikasi dan perangkat.',
                                    fontSize: textFontSize,
                                    width: width,
                                  ),
                                  _buildTipItem(
                                    icon: Icons.app_blocking,
                                    color: Colors.orange,
                                    text: 'Pilih aplikasi edukatif yang sesuai usia, bebas iklan, dan aman dari pembelian dalam aplikasi.',
                                    fontSize: textFontSize,
                                    width: width,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: width * 0.04),
                    // Footer
                    Center(
                      child: Text(
                        'Mari wujudkan ruang digital yang sehat dan aman untuk buah hati kita.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: textFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildTipItem({
    required IconData icon,
    required Color color,
    required String text,
    required double fontSize,
    required double width,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: fontSize * 1.5),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
