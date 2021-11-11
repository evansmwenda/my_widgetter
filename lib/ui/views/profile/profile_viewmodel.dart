import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/app/app.locator.dart';
class ProfileViewModel extends BaseViewModel {
  String title='second screen ';
  final _bottomSheetService = locator<BottomSheetService>();

  void doSomething(){
    title += " new updated";
    showBasicBottomSheet();
    //display bottom sheets
  }

  Future showBasicBottomSheet() async {
    await _bottomSheetService.showBottomSheet(
      title: 'The basic bottom sheet',
      description:
      'Use this bottom sheet function to show something to the user. It\'s better than the standard alert dialog in terms of UI quality.',
    );
  }
}