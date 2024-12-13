import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Grid layout instead of row
      childAspectRatio: 0.8,
      shrinkWrap: true, // Avoids scrolling issues
      physics: NeverScrollableScrollPhysics(), // Prevent scroll within grid
      children: [
        Service("High-Quality Escorts",
            "Experienced professionals for your satisfaction"),
        Service("Confidential Service", "Your privacy is our priority"),
        Service("24/7 Availability", "We are available round the clock"),
      ],
    );
  }
}

Widget Service(String title, String subtitle) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, size: 30, color: Colors.blue),
          const SizedBox(height: 10),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Learn More"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    ),
  );
}
