import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rental_admin_dashboard/core/constants/app_constants.dart';
import 'package:rental_admin_dashboard/core/theme/app_theme.dart';

/// Analytics Charts Section with Monthly Revenue Line Chart
class AnalyticsSection extends StatefulWidget {
  const AnalyticsSection({Key? key}) : super(key: key);

  @override
  State<AnalyticsSection> createState() => _AnalyticsSectionState();
}

class _AnalyticsSectionState extends State<AnalyticsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Monthly Revenue Chart
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.spacing20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly Revenue',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: AppConstants.spacing4),
                        Text(
                          'Income vs expenses vs profit',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacing12,
                        vertical: AppConstants.spacing8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).dividerColor),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMd),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '2024',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: AppConstants.spacing8),
                          const Icon(Icons.expand_more, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing24),
                // Line Chart
                SizedBox(
                  height: 250,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 20000,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Theme.of(context).dividerColor,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                '\$${(value ~/ 1000).toInt()}k',
                                style: Theme.of(context).textTheme.labelSmall,
                              );
                            },
                            reservedSize: 40,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final months = [
                                'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                              ];
                              return Text(
                                months[value.toInt()],
                                style: Theme.of(context).textTheme.labelSmall,
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                          left: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                        ),
                      ),
                      lineBarsData: [
                        // Revenue line
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 50000),
                            FlSpot(1, 48000),
                            FlSpot(2, 52000),
                            FlSpot(3, 51000),
                            FlSpot(4, 53000),
                            FlSpot(5, 55000),
                            FlSpot(6, 54000),
                            FlSpot(7, 56000),
                            FlSpot(8, 58000),
                            FlSpot(9, 59000),
                            FlSpot(10, 60000),
                            FlSpot(11, 62000),
                          ],
                          isCurved: true,
                          color: AppTheme.primary,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppTheme.primary.withOpacity(0.1),
                          ),
                        ),
                        // Profit line
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 40000),
                            FlSpot(1, 42000),
                            FlSpot(2, 41000),
                            FlSpot(3, 43000),
                            FlSpot(4, 44000),
                            FlSpot(5, 45000),
                            FlSpot(6, 46000),
                            FlSpot(7, 47000),
                            FlSpot(8, 48000),
                            FlSpot(9, 49000),
                            FlSpot(10, 50000),
                            FlSpot(11, 51000),
                          ],
                          isCurved: true,
                          color: AppTheme.secondary,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppTheme.secondary.withOpacity(0.1),
                          ),
                        ),
                        // Expenses line
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 20000),
                            FlSpot(1, 18000),
                            FlSpot(2, 19000),
                            FlSpot(3, 18000),
                            FlSpot(4, 19000),
                            FlSpot(5, 20000),
                            FlSpot(6, 19000),
                            FlSpot(7, 20000),
                            FlSpot(8, 21000),
                            FlSpot(9, 20000),
                            FlSpot(10, 21000),
                            FlSpot(11, 22000),
                          ],
                          isCurved: true,
                          color: AppTheme.warning,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppTheme.warning.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spacing16),
                // Legend
                Wrap(
                  spacing: AppConstants.spacing20,
                  children: [
                    _buildLegendItem(context, 'Revenue', AppTheme.primary),
                    _buildLegendItem(context, 'Profit', AppTheme.secondary),
                    _buildLegendItem(context, 'Expenses', AppTheme.warning),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Build legend item
  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: AppConstants.spacing8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}