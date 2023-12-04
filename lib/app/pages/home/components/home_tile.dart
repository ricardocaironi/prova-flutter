import 'package:flutter/material.dart';
import 'package:prova_flutter/app/custom/custom_app_theme.dart';
import 'package:prova_flutter/app/pages/common_widgets/card_text_form_field.dart';
import 'package:prova_flutter/app/pages/common_widgets/privacy_button.dart';
import 'package:prova_flutter/app/pages/home/components/saved_information_card.dart';
import 'package:prova_flutter/app/pages/utils/util_delete_confirmation_dialog.dart';
import 'package:prova_flutter/app/pages/utils/util_edit_information_dialog.dart';
import 'package:prova_flutter/app/store/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTile extends StatefulWidget {
  const HomeTile({Key? key}) : super(key: key);

  @override
  HomeTileState createState() => HomeTileState();
}

class HomeTileState extends State<HomeTile> {
  final TextEditingController textController = TextEditingController();
  List<String> savedInformationList = [];

  @override
  void initState() {
    super.initState();
    _loadSavedInformationList();
  }

  Future<void> _loadSavedInformationList() async {
    savedInformationList = await Store.loadSavedInformationList();
    setState(() {});
  }

  Future<void> _saveInformation(String information) async {
    await Store.saveInformation(information);
    _loadSavedInformationList();
  }

  Future<void> _deleteInformation(int index) async {
    await Store.deleteInformation(index);
    _loadSavedInformationList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      decoration: CustomAppTheme.gradientBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SavedInformationCard(
                savedInformationList: savedInformationList,
                onEdit: (index) async {
                  String? newText = await EditInformationDialog.show(
                    context,
                    savedInformationList[index],
                  );
                  if (newText != null) {
                    savedInformationList[index] = newText;
                    await _updateSavedInformationList();
                  }
                },
                onDelete: (index) async {
                  bool? confirmDelete =
                      await DeleteConfirmationDialog.show(context);
                  if (confirmDelete == true) {
                    await _deleteInformation(index);
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                onSave: (text) async {
                  await _saveInformation(text);
                },
              ),
              const SizedBox(height: 100),
              const PrivacyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateSavedInformationList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('savedInformationList', savedInformationList);
    setState(() {});
  }
}