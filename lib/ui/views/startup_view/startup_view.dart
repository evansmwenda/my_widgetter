import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widgetter/core/constants/colors.dart';
import 'package:widgetter/core/constants/ui_helpers.dart';
import 'package:widgetter/ui/views/startup_view/startup_viewmodel.dart';
import 'package:widgetter/ui/widgets/dsi_button.dart';
import 'package:widgetter/ui/widgets/dsi_text.dart';
import 'package:widgetter/ui/widgets/form_widgets.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  final TextEditingController emailController =  TextEditingController(text: 'janedoe@dsi-app.com');
  final List<String> _loanNames = [
    'john',
    'doe',
    'coder',
    'breaker',
    'scientist',
    'geologist'
  ];
  String? _accountName;
  @override
  void initState() {
    focusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() => isFocused = !isFocused);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady:  (viewModel) => viewModel.initialise(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>  model.doSomething(),
          child: const Center(
            child: Icon(Icons.directions_rounded),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            DsiText.headingOne('Design system'),
            verticalSpaceSmall,
            const Divider(),
            verticalSpaceSmall,
            ...buttonWidgets,
            ...textWidgets,
            ...inputFields,
            verticalSpaceSmall,
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
            verticalSpaceSmall,
            DsiTextFormField(
              controller: TextEditingController(),
              labelText: 'Email Address',
              hintText: 'Your Email Address',
            ),
            verticalSpaceSmall,
            DsiTextFormField(
              labelText: 'Email Address',
              leading: Icons.add,
              hintText: 'Your Email Address',
              controller: emailController,
            ),
            verticalSpaceSmall,
            DsiTextField2(
              controller: emailController,
              labelText: 'mwenda exp',
              leading: Icons.account_balance_wallet_rounded,
              textInputType: TextInputType.emailAddress,
            ),
            verticalSpaceSmall,
            const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.dangerous),
              labelText: "XP",
              border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(4.0),
                  ),
            )),
            verticalSpaceSmall,
            const InputDecorator(
              decoration: InputDecoration(
                labelText: 'Not input text',
                prefixIcon: Icon(Icons.dangerous),
                border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(10.0),
                    ),
              ),
              child: Text('content goes here'),
            ),
            verticalSpaceSmall,
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.dangerous),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(30),
                          ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text(
                      'Address',
                      style:
                          isFocused ? TextStyle(color: Colors.blue[800]) : null,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            DsiDropdown(
              labelText: "Select Character",
              dropdownNamesList: _loanNames,
              onSelectedChanged: (String value) async {
                await model.onSelectValue(name: value);
              },
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            verticalSpaceSmall,
            verticalSpaceLarge,
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  List<Widget> get textWidgets => [
         DsiText.headline('Text Styles'),
        verticalSpaceMedium,
        DsiText.headingOne('Heading One'),
        verticalSpaceMedium,
        DsiText.headingTwo('Heading Two'),
        verticalSpaceMedium,
        DsiText.headingThree('Heading Three'),
        verticalSpaceMedium,
        DsiText.headline('Headline'),
        verticalSpaceMedium,
        DsiText.subheading('This will be a sub heading to the headling'),
        verticalSpaceMedium,
        DsiText.body('Body Text that will be used for the general body'),
        verticalSpaceMedium,
        DsiText.caption(
            'This will be the caption usually for smaller details'),
        verticalSpaceMedium,
      ];

  List<Widget> get buttonWidgets => [
        DsiText.headline('Buttons'),
        verticalSpaceMedium,
        DsiText.body('Normal'),
        verticalSpaceSmall,
        const DsiButton(
          title: 'SIGN IN',
        ),
        verticalSpaceSmall,
        DsiText.body('Disabled'),
        verticalSpaceSmall,
        const DsiButton(
          title: 'SIGN IN',
          disabled: true,
        ),
        verticalSpaceSmall,
        DsiText.body('Busy'),
        verticalSpaceSmall,
        const DsiButton(
          title: 'SIGN IN',
          busy: true,
        ),
        verticalSpaceSmall,
        DsiText.body('Outline'),
        verticalSpaceSmall,
        const DsiButton.outline(
          title: 'Select location',
          leading: Icon(
            Icons.send,
            color: kcPrimaryColor,
          ),
        ),
        verticalSpaceMedium,
      ];

  List<Widget> get inputFields => [
        DsiText.headline('Input Field'),
        verticalSpaceSmall,
        DsiText.body('Normal'),
        verticalSpaceSmall,
        DsiTextFormField(
          controller: TextEditingController(),
          labelText: 'Enter Password',
          hintText: '',
        ),
        verticalSpaceSmall,
        DsiText.body('Leading Icon'),
        verticalSpaceSmall,
        DsiTextFormField(
          controller: TextEditingController(),
          leading: Icons.reset_tv,
          labelText: 'Enter TV Code',
          hintText: '',
        ),
        verticalSpaceSmall,
        DsiText.body('Trailing Icon'),
        verticalSpaceSmall,
        DsiTextFormField(
          controller: TextEditingController(),
          leading: Icons.clear_outlined,
          labelText: 'Search for things',
          hintText: '',
        ),
      ];
}
