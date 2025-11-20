import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const DoctorDetailsPage({
    super.key,
    this.name = 'Dr. Emma Kathrin',
    this.role = 'Cardiologist',
    this.imageUrl = 'assets/images/dr.emma.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top bar
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border_outlined,
                        color: Colors.black87),
                    onPressed: () {},
                  ),
                ],
              ),

              // profile header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF101522),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role,
                        style: const TextStyle(
                            color: Color(0xFF3CB5A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 2),
                      const Text('MBBS',
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),

              // stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _StatItem(
                      icon: Icons.star_border,
                      value: '4.3',
                      label: 'Rating & Review'),
                  _StatItem(
                      icon: Icons.work_outline,
                      value: '14',
                      label: 'Years of work'),
                  _StatItem(
                      icon: Icons.people_outline,
                      value: '125',
                      label: 'No. of patients'),
                ],
              ),
              const SizedBox(height: 24),

              // tabs
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    _TabItem(title: 'Info', selected: true),
                    _TabItem(title: 'History'),
                    _TabItem(title: 'Review'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // appointment card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFECECEC)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F9FA),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'In-Clinic Appointment',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(
                            '৳1,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Evercare Hospital Ltd.',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 2),
                          const Text('Boshundhora, Dhaka',
                              style: TextStyle(
                                  color: Color(0xFF3CB5A3), fontSize: 13)),
                          const SizedBox(height: 2),
                          const Text('20 mins or less wait time',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text('Today',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 20),
                              Text('Tomorrow (20 Slot)',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 20),
                              Text('17 Oct (30 Slot)',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const Divider(height: 20),
                          Wrap(
                            spacing: 8,
                            children: const [
                              _SlotItem('06:00 - 06:30'),
                              _SlotItem('06:30 - 07:00'),
                              _SlotItem('07:00 - 07:30'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // timing section
              const Text('Timing',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _InfoCard(day: 'Monday', time: '09:00 AM - 05:00 PM'),
                  _InfoCard(day: 'Tuesday', time: '09:00 AM - 05:00 PM'),
                  _InfoCard(day: 'Wednesday', time: 'Closed'),
                ],
              ),
              const SizedBox(height: 24),

              // location section
              const Text('Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _LocationCard(
                      title: 'Shahbag',
                      subtitle: 'BSSMU - Bangabandhu Sheikh Mujib'),
                  _LocationCard(
                      title: 'Boshundhora', subtitle: 'Evercare Hospital Ltd'),
                  _LocationCard(
                      title: 'Banani', subtitle: 'Popular Diagnostic Center'),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.amber, size: 22),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
        const SizedBox(height: 2),
        Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  const _TabItem({required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class _SlotItem extends StatelessWidget {
  final String time;
  const _SlotItem(this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE7FAF9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(time,
          style: const TextStyle(
              color: Color(0xFF208678), fontWeight: FontWeight.w500)),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String day;
  final String time;

  const _InfoCard({required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _LocationCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 16, color: Colors.teal),
              const SizedBox(width: 4),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}
