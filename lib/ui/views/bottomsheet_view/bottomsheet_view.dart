import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widgetter/core/constants/colors.dart';
import 'package:widgetter/core/constants/ui_helpers.dart';
import 'package:widgetter/ui/views/bottomsheet_view/bottomsheet_viewmodel.dart';
import 'package:widgetter/ui/views/profile/profile_viewmodel.dart';
import 'package:widgetter/ui/widgets/dsi_appbar.dart';
import 'package:widgetter/ui/widgets/dsi_button.dart';
import 'package:widgetter/ui/widgets/dsi_text.dart';
import 'package:widgetter/ui/widgets/form_widgets.dart';

class BottomSheetView extends StatelessWidget {

  BottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomSheetViewModel>.reactive(
      onModelReady:  (viewModel) => viewModel.initialise(),
      viewModelBuilder: () => BottomSheetViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const DsiAppBar(text: 'BottomSheets'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView(children: [
            verticalSpaceMedium,
            DsiButton(
              title: 'basic bottomsheet',
              onTap: () => model.showBasicBottomSheet(),
            ),
            verticalSpaceMedium,
            DsiButton.outline(
              onTap: () => model.showConfirmationBottomSheet(),
              title: 'Confirmation bottomsheet',
              leading: const Icon(
                Icons.send,
                color: kcPrimaryColor,
              ),
            ),
            DsiText.body(model.confirmationResult ? "Confirmed" : "Disagreed"),
            verticalSpaceMedium,
            verticalSpaceMedium,
            verticalSpaceMedium,
            verticalSpaceMedium,
            verticalSpaceMedium,
            verticalSpaceMedium,

          ],),
        ),
      ),
    );
  }
}
