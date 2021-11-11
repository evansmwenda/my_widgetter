import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widgetter/ui/views/profile/profile_viewmodel.dart';
import 'package:widgetter/ui/widgets/dsi_appbar.dart';
import 'package:widgetter/ui/widgets/dsi_text.dart';
import 'package:widgetter/ui/widgets/form_widgets.dart';

class ProfileView extends StatelessWidget {
  final String name;

  final TextEditingController nameController =  TextEditingController(text: 'Jane Doe');
  final TextEditingController emailController =  TextEditingController(text: 'janedoe@dsi-app.com');
  final TextEditingController phoneController =  TextEditingController(text: '+19987356421');
  final TextEditingController addressController =  TextEditingController(text: '74133, St Tulsa, Oklahoma City');

  ProfileView({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const DsiAppBar(text: 'My Profile'),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.doSomething(),
          child: const Center(
            child: Icon(Icons.add),
          ),
        ),
        body: ListView(children: [
            const SizedBox(
            height: 10,),
          Center(child: DsiText.body(name)),
          const SizedBox(
            width: 130,
            height: 130,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/130x130/?portrait',
              ),
            ),
          ),
          const SizedBox(height: 30),
          DsiTextFormField(
            labelText: 'Name',
            hintText: 'Your Username',
            controller: nameController,
          ),
          const SizedBox(height: 20),
          DsiTextFormField(
            labelText: 'Email Address',
            hintText: 'Your Email Address',
            controller: emailController,
          ),
          const SizedBox(height: 20),
          DsiTextFormField(
            labelText: 'Phone Number',
            hintText: 'Your Phone Number',
            controller: phoneController,
          ),
          const SizedBox(height: 20),
          DsiTextFormField(
            labelText: 'Address',
            hintText: 'Your Address',
            controller: addressController,
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: Text(model.title),
          ),
        ]),
      ),
    );
  }
}
