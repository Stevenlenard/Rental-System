import 'package:flutter/material.dart';
import 'package:rental_admin_dashboard/models/kpi_card_model.dart';
import 'package:rental_admin_dashboard/models/activity_model.dart';
import 'package:rental_admin_dashboard/models/ai_insight_model.dart';

/// Provider for managing dashboard state and data
class DashboardProvider extends ChangeNotifier {
  bool _sidebarExpanded = true;
  final List<KPICardModel> _kpiCards = [];
  final List<ActivityModel> _recentActivities = [];
  late AIInsightModel _aiInsight;

  bool get sidebarExpanded => _sidebarExpanded;

  List<KPICardModel> get kpiCards => _kpiCards;

  List<ActivityModel> get recentActivities => _recentActivities;

  AIInsightModel get aiInsight => _aiInsight;

  /// Toggle sidebar expansion state
  void toggleSidebar() {
    _sidebarExpanded = !_sidebarExpanded;
    notifyListeners();
  }

  /// Initialize dummy data for dashboard
  void initializeDummyData() {
    _loadKPICards();
    _loadRecentActivities();
    _loadAIInsight();
  }

  /// Load dummy KPI data
  void _loadKPICards() {
    _kpiCards.clear();
    _kpiCards.addAll([
      KPICardModel(
        title: 'Total Properties',
        value: 24,
        icon: Icons.apartment,
        trend: 2.0,
        trendLabel: 'this year',
        color: Colors.blue,
      ),
      KPICardModel(
        title: 'Occupied Properties',
        value: 18,
        icon: Icons.home,
        trend: 1.0,
        trendLabel: 'this month',
        color: Colors.green,
      ),
      KPICardModel(
        title: 'Vacant Properties',
        value: 4,
        icon: Icons.domain,
        trend: -2.0,
        trendLabel: 'last mo.',
        color: Colors.red,
      ),
      KPICardModel(
        title: 'Active Tenants',
        value: 21,
        icon: Icons.people,
        trend: 3.0,
        trendLabel: 'this quarter',
        color: Colors.orange,
      ),
      KPICardModel(
        title: 'Monthly Revenue',
        value: 61400,
        icon: Icons.attach_money,
        trend: 8.3,
        trendLabel: 'this week',
        color: Colors.purple,
        isCurrency: true,
      ),
      KPICardModel(
        title: 'Annual Revenue',
        value: 614800,
        icon: Icons.trending_up,
        trend: 11.2,
        trendLabel: 'YoY',
        color: Colors.teal,
        isCurrency: true,
      ),
      KPICardModel(
        title: 'Pending Maintenance',
        value: 5,
        icon: Icons.build,
        trend: 2.0,
        trendLabel: 'this week',
        color: Colors.amber,
      ),
      KPICardModel(
        title: 'Expiring Contracts',
        value: 3,
        icon: Icons.description,
        trend: 0.0,
        trendLabel: 'Within 60 days',
        color: Colors.redAccent,
      ),
    ]);
  }

  /// Load dummy recent activities
  void _loadRecentActivities() {
    _recentActivities.clear();
    _recentActivities.addAll([
      ActivityModel(
        title: 'Property Added',
        description: 'Downtown Apartment Complex - Unit A',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'property',
        icon: Icons.home,
      ),
      ActivityModel(
        title: 'Contract Uploaded',
        description: 'John Doe - 12-month lease agreement',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: 'contract',
        icon: Icons.description,
      ),
      ActivityModel(
        title: 'Tenant Updated',
        description: 'Sarah Smith - Contact information updated',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        type: 'tenant',
        icon: Icons.person,
      ),
      ActivityModel(
        title: 'Maintenance Completed',
        description: 'Unit 5B - HVAC System Maintenance',
        timestamp: DateTime.now().subtract(const Duration(hours: 12)),
        type: 'maintenance',
        icon: Icons.build,
      ),
      ActivityModel(
        title: 'Payment Received',
        description: 'Monthly rent from Harbor View Units - \$8,500',
        timestamp: DateTime.now().subtract(const Duration(hours: 24)),
        type: 'payment',
        icon: Icons.payment,
      ),
    ]);
  }

  /// Load dummy AI insight
  void _loadAIInsight() {
    _aiInsight = AIInsightModel(
      title: 'Harbor View Unit 12 has been vacant for 45 days.',
      confidence: 94,
      recommendations: [
        'Reduce rental price by 5% (\$3,100 → \$2,945)',
        'Update property photos with professional shots',
        'Promote listing on Zillow, Apartments.com',
      ],
    );
  }
}