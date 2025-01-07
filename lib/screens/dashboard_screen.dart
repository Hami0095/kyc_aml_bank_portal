// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class DashboardScreen extends StatelessWidget {
//   final String userType;

//   DashboardScreen({
//     Key? key,
//     required this.userType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Dashboard",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.blueGrey.shade900,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             _buildDashboardCard(
//               title: "Recent Transactions",
//               subtitle: "View recent flagged transactions",
//               icon: Icons.list_alt,
//               color: Colors.blue,
//             ),
//             _buildDashboardCard(
//               title: "Alerts",
//               subtitle: "Monitor suspicious activity",
//               icon: Icons.warning,
//               color: Colors.orange,
//             ),
//             _buildDashboardCard(
//               title: "KYC Database",
//               subtitle: "Manage KYC data",
//               icon: Icons.verified_user,
//               color: Colors.green,
//             ),
//             _buildDashboardCard(
//               title: "User Management",
//               subtitle: "Add/Remove Fraud Analysts",
//               icon: Icons.people,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDashboardCard({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Card(
//       color: Colors.blueGrey.shade800,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, color: color, size: 40),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: TextStyle(color: Colors.white70),
//             ),
//             const Spacer(),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Icon(Icons.arrow_forward, color: Colors.white70),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route; // Route to navigate to

  DashboardItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });
}

class DashboardScreen extends StatelessWidget {
  final String userType;

  DashboardScreen({
    Key? key,
    required this.userType,
  }) : super(key: key);

  // Define a DashboardItem class to hold information about each card

  @override
  Widget build(BuildContext context) {
    // Initialize the list of dashboard items
    List<DashboardItem> dashboardItems = [
      DashboardItem(
        title: "Recent Transactions",
        subtitle: "View recent flagged transactions",
        icon: Icons.list_alt,
        color: Colors.blue,
        route: '/recentTransactions', // Define the route
      ),
      DashboardItem(
        title: "Alerts",
        subtitle: "Monitor suspicious activity",
        icon: Icons.warning,
        color: Colors.orange,
        route: '/alerts',
      ),
      DashboardItem(
        title: "KYC Database",
        subtitle: "Manage KYC data",
        icon: Icons.verified_user,
        color: Colors.green,
        route: '/kycDatabase',
      ),
    ];

    // Add "User Management" only if the user is an Admin
    if (userType == 'Admin') {
      dashboardItems.add(
        DashboardItem(
          title: "User Management",
          subtitle: "Add/Remove Fraud Analysts",
          icon: Icons.people,
          color: Colors.purple,
          route: '/userManagement',
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: dashboardItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = dashboardItems[index];
            return _buildDashboardCard(
              title: item.title,
              subtitle: item.subtitle,
              icon: item.icon,
              color: item.color,
              route: item.route,
              context: context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String route,
    required BuildContext context,
  }) {
    return Card(
      color: Colors.blueGrey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title Row
            Row(
              children: [
                Icon(icon, color: color, size: 40),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Subtitle
            Text(
              subtitle,
              style: TextStyle(color: Colors.white70),
            ),
            const Spacer(),
            // Navigate Button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color, // Button color matches the icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
