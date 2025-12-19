import 'package:flutter/material.dart';

void main() {
  runApp(const BabilApp());
}

class BabilApp extends StatelessWidget {
  const BabilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BABIL',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Başlık
              const Text(
                'BABIL',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Maçı anlamadan girme.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              BabilButton(
                title: '🚫 Asla Girme Senaryoları',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContentScreen(
                        title: 'Asla Girme Senaryoları',
                        content:
                            '• İlk 10 dakikada aşırı baskı yoksa\n'
                            '• Oran çok hızlı düşmüşse\n'
                            '• Favori takım isteksiz görünüyorsa\n'
                            '• Canlıda şut yok ama oran düşüyorsa\n\n'
                            'Bu maçlara girilmez.',
                      ),
                    ),
                  );
                },
              ),

              BabilButton(
                title: '⏱ Canlıda Gol Neden Gelmez',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContentScreen(
                        title: 'Canlıda Gol Neden Gelmez',
                        content:
                            '• Tempo düşmüşse\n'
                            '• Takımlar beraberliğe razıysa\n'
                            '• Orta saha pasları çoğalmışsa\n'
                            '• Faul ve duran top yoksa\n\n'
                            'Gol ihtimali düşer.',
                      ),
                    ),
                  );
                },
              ),

              BabilButton(
                title: '📘 Babil Mantığı',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContentScreen(
                        title: 'Babil Mantığı',
                        content:
                            'Babil, tahmin vermez.\n\n'
                            'Babil, girmemen gereken maçı gösterir.\n\n'
                            'Kazanç, çoğu zaman girmemekle başlar.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BabilButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BabilButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1D24),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  final String title;
  final String content;

  const ContentScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
