import 'package:expenses_track/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 133, 21, 123),
);
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: const Color(0xFF2C061F));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondary,
                fontSize: 16,
              ),
              bodyMedium: TextStyle(color: kColorScheme.tertiary),
            ),
        iconTheme: const IconThemeData().copyWith(color: kColorScheme.tertiary),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kDarkColorScheme.onSecondary,
                fontSize: 16,
              ),
              bodyMedium: TextStyle(color: kDarkColorScheme.tertiary),
              bodySmall: TextStyle(color: kDarkColorScheme.tertiary),
            ),
        iconTheme:
            const IconThemeData().copyWith(color: kDarkColorScheme.tertiary),
      ),
      //themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
