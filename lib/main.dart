import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: const Color(0xFF272727),
        dividerTheme: const DividerThemeData(color: Colors.white24),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF272727),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            )
        ),
        primarySwatch: Colors.yellow,
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,

          ),

          labelSmall: TextStyle(  

            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,

          ),
        ),

      ),
      home: const MyHomePage(title: 'Crypto Currencies List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
      
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),  
      ),

      body: ListView.separated(
        
        itemCount: 10,
        separatorBuilder: (context, index) =>  const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            height: 30,
            width: 30,
            ),
          title: Text(
            "Bitcoin", 
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            "20000000\$",
            style: theme.textTheme.labelSmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios,),
        ),

        ),
      
    );
  }
}
