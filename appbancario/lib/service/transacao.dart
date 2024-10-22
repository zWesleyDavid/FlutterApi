import 'abstract_api.dart';

class Transacao {
  int id;
  String nome;
  double valor;

  Transacao({required this.id, required this.nome, required this.valor});

  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
      id: int.parse(json['id'].toString()),
      nome: json['nome'],
      valor: json['valor'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'valor': valor,
    };
  }
}

class TransacaoApi extends AbstractApi {
  // Método para converter JSON em uma lista de transações
  Future<List<Transacao>> getAllTransacoes() async {
    final List<dynamic> jsonList = await getAll();
    return jsonList.map((json) => Transacao.fromJson(json)).toList();
  }

  // Método para criar uma transação
  Future<void> createTransacao(Transacao transacao) async {
    await create(transacao.toJson());
  }

  // Método para atualizar uma transação
  Future<void> updateTransacao(int id, Transacao transacao) async {
    await update(id, transacao.toJson());
  }

  // Método para deletar uma transação
  Future<void> deleteTransacao(int id) async {
    await delete(id);
  }
}
