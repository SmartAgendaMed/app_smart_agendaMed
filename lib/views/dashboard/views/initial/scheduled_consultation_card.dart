import 'package:flutter/material.dart';
import 'package:hack10/views/dashboard/model/scheduled_consultation.dart';
import 'package:intl/intl.dart';

class ScheduledConsultationCard extends StatelessWidget {
  final ScheduledConsultation scheduledConsultation;
  const ScheduledConsultationCard({
    super.key, required this.scheduledConsultation,
  });

  @override
  Widget build(BuildContext context) {



    DateTime dateTime = scheduledConsultation.date;
    String formattedDate = DateFormat('dd/MM').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return Column(
      children: [
        Card(
          elevation: 2,
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: Icon(Icons.calendar_month),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Consulta agendada",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            subtitle: Text("Data: ${formattedDate} às ${formattedTime}"),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700),
                  onPressed: () {},
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("Reagendar Consulta",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
