import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/ui/views/bottomsheet_view/bottomsheet_view.dart';
import 'package:widgetter/ui/views/profile/profile_view.dart';
import 'package:widgetter/ui/views/startup_view/startup_view.dart';

@StackedApp(
  routes : [
    //state the routes
    MaterialRoute(page: StartupView, initial:true,),
    CupertinoRoute(page: ProfileView),
    CupertinoRoute(page: BottomSheetView),
  ],
    dependencies: [
      LazySingleton(classType: NavigationService),
      LazySingleton(classType: BottomSheetService),
    ]
)

class AppSetup{
  //serves no purpose besides having an annotation attached to it
}