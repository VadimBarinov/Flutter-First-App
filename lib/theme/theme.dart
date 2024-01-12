import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: const Color(0xFF272727),
        dividerTheme: const DividerThemeData(color: Colors.white24),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
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

);