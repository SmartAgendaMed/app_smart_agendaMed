


import 'package:flutter/material.dart';
import 'package:hack10/views/dashboard/dashboard_page.dart';

class DashboardHistoricPage extends StatelessWidget {
  const DashboardHistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardPage(
        body: Column(
        children: [

          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Consulta agendada",
              style: TextStyle(
                  color: Theme.of(context).primaryColor
              ),
            ),
            subtitle: Text("27/08 às 14:00"),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700
            ),
            onPressed: (){},
            child: Text("Reagendar Consulta",
                style: TextStyle(
                    color: Colors.white
                )
            ),
          ),

        ]
    )
    );
  }
}
