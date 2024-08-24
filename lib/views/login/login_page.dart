




import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hack10/core/widgets/app_logo.dart';
import 'package:hack10/views/dashboard/views/initial/dashboard_initial_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8fde8),
      body: Container(
        height:
        MediaQuery.of(context).size.height,
        child: Column(
          children: [

            SizedBox(
              height: 70,
            ),
            Align(
              child: Container(
                width: 220,
                  height: 220,
                  child: AppLogo()),
            ),

            SizedBox(
              height: 20,
            ),
            Text("CONSULTAS HU",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),

            Spacer(),
            /*SizedBox(
              height: 100,
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff58b01d),
                            padding: EdgeInsets.all(16)),
                        onPressed: (){
                      context.push(DashboardInitialRoute().routePath);
                    }, child: Text("Entrar com GOV.BR",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                    )),
                  ),
                ],
              ),
            ),
          //  Spacer(),
            SizedBox(
              height: 70,
            ),
            Text("Desenvolvido por @Equipe6",),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
