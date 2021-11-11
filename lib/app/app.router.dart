// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/bottomsheet_view/bottomsheet_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/startup_view/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String profileView = '/profile-view';
  static const String bottomSheetView = '/bottom-sheet-view';
  static const all = <String>{
    startupView,
    profileView,
    bottomSheetView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.bottomSheetView, page: BottomSheetView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      var args = data.getArgs<ProfileViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ProfileView(
          key: args.key,
          name: args.name,
        ),
        settings: data,
      );
    },
    BottomSheetView: (data) {
      var args = data.getArgs<BottomSheetViewArguments>(
        orElse: () => BottomSheetViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => BottomSheetView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfileView arguments holder class
class ProfileViewArguments {
  final Key? key;
  final String name;
  ProfileViewArguments({this.key, required this.name});
}

/// BottomSheetView arguments holder class
class BottomSheetViewArguments {
  final Key? key;
  BottomSheetViewArguments({this.key});
}
