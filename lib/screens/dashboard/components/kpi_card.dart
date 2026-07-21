import 'package:flutter/material.dart';
import 'package:rental_admin_dashboard/core/constants/app_constants.dart';
import 'package:rental_admin_dashboard/models/kpi_card_model.dart';

/// Individual KPI Card Widget
class KPICard extends StatefulWidget {
  final KPICardModel kpiCard;

  const KPICard({Key? key, required this.kpiCard}) : super(key: key);

  @override
  State<KPICard> createState() => _KPICardState();
}

class _KPICardState extends State<KPICard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: AppConstants.animationDurationNormal),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.spacing20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Icon and Trend
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppConstants.spacing12),
                      decoration: BoxDecoration(
                        color: widget.kpiCard.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMd),
                      ),
                      child: Icon(
                        widget.kpiCard.icon,
                        color: widget.kpiCard.color,
                        size: 24,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          widget.kpiCard.trendIcon,
                          color: widget.kpiCard.trendColor,
                          size: 18,
                        ),
                        const SizedBox(width: AppConstants.spacing4),
                        Text(
                          '${widget.kpiCard.trend > 0 ? '+' : ''}${widget.kpiCard.trend.toStringAsFixed(1)}%',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: widget.kpiCard.trendColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing12),
                // Value
                Text(
                  widget.kpiCard.formattedValue,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.spacing4),
                // Title
                Text(
                  widget.kpiCard.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.spacing8),
                // Trend Label
                Text(
                  widget.kpiCard.trendLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: widget.kpiCard.trendColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}