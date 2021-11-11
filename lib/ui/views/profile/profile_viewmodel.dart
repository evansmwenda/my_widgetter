import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/app/app.locator.dart';
import 'package:widgetter/app/app.router.dart';
class ProfileViewModel extends BaseViewModel {
  String title='second screen ';
  final _navigationService = locator<NavigationService>();

  void doSomething(){
    title += " new updated";
    _navigationService.navigateTo(Routes.bottomSheetView);
  }


}