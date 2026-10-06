import 'package:flutter/material.dart';

void main() {
  runApp(const MasterR0ELiteApp());
}

class MasterR0ELiteApp extends StatelessWidget {
  const MasterR0ELiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterR0E Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E1117),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF7AA2FF),
          secondary: const Color(0xFF7BE3C9),
          surface: const Color(0xFF181D27),
          background: const Color(0xFF0E1117),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      {'name': 'Phone', 'icon': Icons.phone_rounded, 'color': const Color(0xFF6AC7FF)},
      {'name': 'Messages', 'icon': Icons.message_rounded, 'color': const Color(0xFF7BE3C9)},
      {'name': 'Camera', 'icon': Icons.camera_alt_rounded, 'color': const Color(0xFFFFB86C)},
      {'name': 'Browser', 'icon': Icons.language_rounded, 'color': const Color(0xFF9AD6FF)},
      {'name': 'Gallery', 'icon': Icons.photo_library_rounded, 'color': const Color(0xFFFF8FA3)},
      {'name': 'Music', 'icon': Icons.music_note_rounded, 'color': const Color(0xFF8BE28C)},
      {'name': 'Maps', 'icon': Icons.map_rounded, 'color': const Color(0xFF8AA5FF)},
      {'name': 'Settings', 'icon': Icons.settings_rounded, 'color': const Color(0xFFB7C5FF)},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            children: [
              const TopStatus(),
              const SizedBox(height: 22),
              const ClockCard(),
              const SizedBox(height: 18),
              const QuickControls(),
              const SizedBox(height: 22),
              Expanded(
                child: GridView.builder(
                  itemCount: apps.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    final app = apps[index];
                    return AppGridItem(
                      label: app['name'] as String,
                      icon: app['icon'] as IconData,
                      color: app['color'] as Color,
                    );
                  },
                ),
              ),
              const BottomDock(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopStatus extends StatelessWidget {
  const TopStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('9:41', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
        const Spacer(),
        Row(
          children: const [
            Icon(Icons.signal_cellular_4_bar_rounded, size: 18, color: Colors.white70),
            SizedBox(width: 8),
            Icon(Icons.wifi_rounded, size: 18, color: Colors.white70),
            SizedBox(width: 8),
            Icon(Icons.battery_5_bar_rounded, size: 18, color: Colors.white70),
          ],
        ),
      ],
    );
  }
}

class ClockCard extends StatelessWidget {
  const ClockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2437), Color(0xFF121924)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Good morning', style: TextStyle(color: Colors.white70, fontSize: 12)),
          SizedBox(height: 8),
          Text('9:41', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700, color: Colors.white)),
          SizedBox(height: 4),
          Text('Tue, 12 Sep', style: TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}

class QuickControls extends StatelessWidget {
  const QuickControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF171D27),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _QuickButton(icon: Icons.flash_on_rounded, label: 'Flash'),
          _QuickButton(icon: Icons.wifi_rounded, label: 'Wi‑Fi'),
          _QuickButton(icon: Icons.bluetooth_rounded, label: 'BT'),
          _QuickButton(icon: Icons.brightness_6_rounded, label: 'Light'),
        ],
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF212A37),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: Colors.white, size: 21),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }
}

class AppGridItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const AppGridItem({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: color.withOpacity(0.18),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color.withOpacity(0.7), width: 1.1),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 10),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.white70)),
      ],
    );
  }
}

class BottomDock extends StatelessWidget {
  const BottomDock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 0),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF171D27),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home_rounded, color: Colors.white),
          Icon(Icons.apps_rounded, color: Colors.white70),
          Icon(Icons.notifications_rounded, color: Colors.white70),
          Icon(Icons.person_rounded, color: Colors.white70),
        ],
      ),
    );
  }
}
