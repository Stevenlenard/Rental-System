import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_admin_dashboard/providers/dashboard_provider.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/top_app_bar.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/app_sidebar.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/dashboard_content.dart';
import 'package:rental_admin_dashboard/providers/menu_provider.dart';

/// Main Dashboard Screen
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardProvider dashboardProvider;

  @override
  void initState() {
    super.initState();
    // Initialize dashboard provider with dummy data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardProvider = context.read<DashboardProvider>();
      dashboardProvider.initializeDummyData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: Scaffold(
        body: Row(
          children: [
            // Sidebar
            Consumer<DashboardProvider>(
              builder: (context, dashboardProvider, _) {
                return AppSidebar(
                  isExpanded: dashboardProvider.sidebarExpanded,
                  onToggle: () => dashboardProvider.toggleSidebar(),
                );
              },
            ),
            // Main Content
            Expanded(
              child: Column(
                children: [
                  // Top App Bar
                  const TopAppBar(),
                  // Dashboard Content
                  Expanded(
                    child: DashboardContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}