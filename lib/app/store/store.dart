import 'package:shared_preferences/shared_preferences.dart';

class Store {
  // Função para carregar a lista de informações salvas
  static Future<List<String>> loadSavedInformationList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('savedInformationList') ?? [];
  }

  // Função para salvar a informação na lista
  static Future<void> saveInformation(String information) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedInformationList =
        prefs.getStringList('savedInformationList') ?? [];
    savedInformationList.add(information);
    prefs.setStringList('savedInformationList', savedInformationList);
  }

  // Função para excluir uma informação da lista
  static Future<void> deleteInformation(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedInformationList =
        prefs.getStringList('savedInformationList') ?? [];
    savedInformationList.removeAt(index);
    prefs.setStringList('savedInformationList', savedInformationList);
  }
}
