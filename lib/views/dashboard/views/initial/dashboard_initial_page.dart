import 'package:flutter/material.dart';
import 'package:hack10/views/dashboard/dashboard_page.dart';
import 'package:hack10/views/dashboard/model/scheduled_consultation.dart';
import 'package:hack10/views/dashboard/views/initial/scheduled_consultation_card.dart';


class DashboardInitialPage extends StatelessWidget {
  const DashboardInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardPage(
        body: Column(children: [
          for(ScheduledConsultation consultation in [
      ScheduledConsultation(date: DateTime(2024, 08, 28, 14, 0)),
      ScheduledConsultation(date: DateTime(2024, 09, 28, 14, 0)),
          ])
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ScheduledConsultationCard(
          scheduledConsultation:
              ScheduledConsultation(date: DateTime(2024, 08, 28, 14, 0)),
        ),
      ),

    ]));
  }
}
