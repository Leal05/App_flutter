import 'package:flutter/material.dart';
import 'supplemental/cut_corners_border.dart';
import 'model/product.dart';

import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'category_menu_page.dart';
import 'backdrop.dart';

class VentasApp extends StatefulWidget {
  
  @override
  _VentasAppState createState() => _VentasAppState();
}

class _VentasAppState extends State<VentasApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tvend',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory),
        backLayer: CategoryMenuPage(
           currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('TvenD'),
        backTitle: Text('MENU'),
      ),
       initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _EntasTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}


final ThemeData _EntasTheme = _buildEntasTheme();

ThemeData _buildEntasTheme(){

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Black,
    primaryColor: Gray700,
    primaryIconTheme: base.iconTheme.copyWith(
        color: Black,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Gray700,
      textTheme: ButtonTextTheme.normal,
    ),
      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: Gray700,
    errorColor: Error,
    textTheme: _buildVentasTextTheme(base.textTheme),
    primaryTextTheme: _buildVentasTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildVentasTextTheme(base.accentTextTheme),

      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),

  );
}

TextTheme _buildVentasTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: Black,
    bodyColor: Black,
  );
}
