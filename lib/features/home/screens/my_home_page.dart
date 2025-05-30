import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paper_trading/routes/routes_name.dart';
import 'package:paper_trading/utils/string_constants.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(StringConstants.appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Placeholder(),
            ElevatedButton(
              onPressed: () => context.pushNamed(RoutesName.login),
              child: const Text("Login"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
