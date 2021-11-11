import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/app/app.locator.dart';
import 'package:widgetter/app/app.router.dart';
class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String title='first screen';
  late String _name;

  void initialise(){
    _name = '';
  }

  void doSomething(){
    print("name is $_name");
    _navigationService.navigateTo(Routes.profileView,arguments: ProfileViewArguments(name: _name));
  }

  onSelectValue({required String name}) {
    print("selected name $name");
    _name = name;
    notifyListeners();
  }
}