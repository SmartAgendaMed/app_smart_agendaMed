


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:hack10/views/dashboard/dashboard_page.dart';
import 'package:hack10/views/login/login_route.dart';

class DashboardProfilePage extends StatelessWidget {
  const DashboardProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardPage(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.person,
                    color: Colors.white,
                    size: 50),
              ),
              SizedBox(
                height: 16,
              ),
              Text("Emily Salum",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
              ),

              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(
                    horizontal: 10.0),
                child: Wrap(
                  runSpacing: 16,
                  spacing: 50,
                  children: [
                    for(Map info in [
                      {
                        "name": "CPF",
                        "value": "123.456.789-00"
                      },
                      {
                        "name": "Telefone",
                        "value": "(11) 99999-9999"
                      },
                    ])
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*Icon(Icons.abc, color:
                              Theme.of(context).primaryColor,
                              ),
                            SizedBox(
                              width: 12,
                            ),*/
                            Text(info['name'] +": ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                        Text(info['value'],
                        style: TextStyle(
                          fontSize: 12
                        ),)
                      ],
                    ),

                  ],
                ),
              ),

              Spacer(),
              IconButton(onPressed: (){
                context.read<DashboardBloc>().add(
                    DashboardLogoutEvent()
                );
                context.push(LoginRoute().routePath);
              }, icon: Icon(Icons.logout)),
              SizedBox(
                height: 70,
              )
            ],
          ),
        )
    );
  }
}
