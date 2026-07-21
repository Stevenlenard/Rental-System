import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_admin_dashboard/core/constants/app_constants.dart';
import 'package:rental_admin_dashboard/providers/dashboard_provider.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/kpi_cards_section.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/analytics_section.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/ai_insights_panel.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/recent_activities_section.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/quick_actions_section.dart';
import 'package:rental_admin_dashboard/screens/dashboard/components/occupancy_chart.dart';

/// Main Dashboard Content Area
class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // KPI Cards Section
              const KPICardsSection(),
              const SizedBox(height: AppConstants.spacing32),
              // Quick Actions Section
              const QuickActionsSection(),
              const SizedBox(height: AppConstants.spacing32),
              // Charts Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Chart
                  Expanded(
                    flex: 2,
                    child: const AnalyticsSection(),
                  ),
                  const SizedBox(width: AppConstants.spacing24),
                  // Occupancy Chart
                  Expanded(
                    flex: 1,
                    child: const OccupancyChart(),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing32),
              // AI Insights Panel
              AIInsightsPanel(
                insight: dashboardProvider.aiInsight,
              ),
              const SizedBox(height: AppConstants.spacing32),
              // Recent Activities Section
              RecentActivitiesSection(
                activities: dashboardProvider.recentActivities,
              ),
              const SizedBox(height: AppConstants.spacing32),
            ],
          );
        },
      ),
    );
  }
}