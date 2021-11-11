import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/app/app.locator.dart';
class BottomSheetViewModel extends BaseViewModel {
  String title='second screen ';
  final _bottomSheetService = locator<BottomSheetService>();
  late bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  void initialise(){
    _confirmationResult = false;
    //display bottom sheets
  }

  Future showBasicBottomSheet() async {
    await _bottomSheetService.showBottomSheet(
      title: 'The basic bottom sheet',
      description:
      'Use this bottom sheet function to show something to the user. It\'s better than the standard alert dialog in terms of UI quality.',
    );
  }

  Future showConfirmationBottomSheet() async {
    var sheetResponse = await _bottomSheetService.showBottomSheet(
      title: 'Confirmation of Terms',
      description:
      'I want to use this sheet to confirm some information from you. Is it okay?',
      confirmButtonTitle: 'I confirm this action',
      cancelButtonTitle: 'I dont accept the terms above',
    );

    print('Confirmed: ${sheetResponse?.confirmed}');

    _confirmationResult = sheetResponse!.confirmed;
    notifyListeners();
  }


}