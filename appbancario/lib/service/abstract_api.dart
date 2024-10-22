import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AbstractApi {
  final _urlLocalHost = 'http://localhost:3000';

  Future<List<dynamic>> getAll() async {
    final response = await http.get(Uri.parse('$_urlLocalHost/transacoes'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar dados');
    }
  }

  Future<void> create(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('$_urlLocalHost/transacoes'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao criar item');
    }
  }

  Future<void> update(int id, Map<String, dynamic> item) async {
    final response = await http.put(
      Uri.parse('$_urlLocalHost/transacoes/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar item');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$_urlLocalHost/transacoes/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao excluir item');
    }
  }
}
