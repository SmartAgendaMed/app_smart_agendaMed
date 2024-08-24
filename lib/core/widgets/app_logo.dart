




import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("lib/assets/images/logo_simple.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    return Image.asset(
      "lib/assets/images/logo_simple.jpg",
    );
  }
}
