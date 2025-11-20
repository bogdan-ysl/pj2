import 'package:flutter/material.dart';
import 'doctor_details.dart';

void main() {
  runApp(const MedicalHomeApp());
}

class MedicalHomeApp extends StatelessWidget {
  const MedicalHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color(0xFFF7FBFB),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Bara de sus
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage('assets/images/tanvir.jpg'),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tanvir Ahassan',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Mirpur, Dhaka',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                      color: Colors.black87,
                    )
                  ],
                ),
                const SizedBox(height: 12),

                // Bara de cautare
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Search...',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 8,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),

                // Servicii principale
                Row(
                  children: const [
                    Expanded(
                      child: _ServiceCard(
                        title: 'Book Appointment',
                        imageUrl: 'assets/images/laptop.jpg',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _ServiceCard(
                        title: 'Instant Video Consult',
                        imageUrl: 'assets/images/doctor.jpg',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Alte functii mici
                Row(
                  children: const [
                    Expanded(
                      child: _SmallFeatureCard(
                        title: 'Medicines',
                        imageUrl: 'assets/images/pastile.jpg',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _SmallFeatureCard(
                        title: 'Lab Tests',
                        imageUrl: 'assets/images/labtest.jpg',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _SmallFeatureCard(
                        title: 'Emergency',
                        imageUrl: 'assets/images/emergency.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                // Specialitati
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Specialities most relevant to you',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 92,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 4),
                      const _SpecialityChip(
                          icon: Icons.remove_red_eye, label: 'Eye'),
                      const SizedBox(width: 10),
                      const _SpecialityChip(
                          icon: Icons.medical_services, label: 'Dental'),
                      const SizedBox(width: 10),
                      _SpecialityChip(
                        icon: Icons.favorite,
                        label: 'Heart',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DoctorDetailsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      const _SpecialityChip(icon: Icons.healing, label: 'Skin'),
                      const SizedBox(width: 10),
                      const _SpecialityChip(icon: Icons.air, label: 'Lungs'),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // Lista doctori
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Specialists',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _SpecialistCard(
                        name: 'Dr. A. Rahman',
                        role: 'General Practitioner',
                        imageUrl: 'assets/images/general doc.png',
                      ),
                      SizedBox(width: 12),
                      _SpecialistCard(
                        name: 'Dr. S. Karim',
                        role: 'Cardiologist',
                        imageUrl: 'assets/images/generaldoc2.png',
                      ),
                      SizedBox(width: 12),
                      _SpecialistCard(
                        name: 'Dr. M. Noor',
                        role: 'Pediatrician',
                        imageUrl: 'assets/images/doctor3.jpg',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Indicator jos
                Container(
                  width: 80,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------- COMPONENTE -------------------

class _ServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const _ServiceCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
              color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageUrl,
                  fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _SmallFeatureCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const _SmallFeatureCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Color(0x05000000), blurRadius: 8, offset: Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageUrl,
                width: 68, height: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Expanded(
            child:
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}

class _SpecialityChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _SpecialityChip({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFDFF7F6),
            child: Icon(icon, size: 22, color: Colors.teal),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 80,
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class _SpecialistCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  const _SpecialistCard(
      {required this.name, required this.role, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
              color: Color(0x0A000000), blurRadius: 12, offset: Offset(0, 6))
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset(imageUrl,
                    height: 120, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(6),
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorDetailsPage(
                            name: name,
                            role: role,
                            imageUrl: imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 6),
                Text(role, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorDetailsPage(
                              name: name,
                              role: role,
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        elevation: 0,
                      ),
                      child: const Text('Book'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorDetailsPage(
                              name: name,
                              role: role,
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Details'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
