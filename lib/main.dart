import 'package:flutter/material.dart';

void main()  {
  runApp(DebitCreditApp());
}

class DebitCreditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avaliação 1',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DebitCreditPage(),
    );
  }
}

class DebitCreditPage extends StatefulWidget {
  @override
  _DebitCreditPageState createState() => _DebitCreditPageState();
}

class _DebitCreditPageState extends State<DebitCreditPage> {
  final _valorController = TextEditingController();
  String? _tipoTransacao;
  List<Map<String, dynamic>> transacoes = [];

  void _atualizarTipoTransacao(String tipo) {
    setState(() {
      _tipoTransacao = tipo;

      
      final double? valorConvertido = double.tryParse(_valorController.text);

      if (valorConvertido != null && valorConvertido != 0 && _tipoTransacao != null) {
        transacoes.add({'tipo': _tipoTransacao, 'valor': valorConvertido});
      }
    });
  }

  void _resetarTransacoes() {
    setState(() {
      transacoes.clear();
      _tipoTransacao = null;
      _valorController.clear();
    });
  }

  double _calcularValorTotal() {
    double total = 0.0;
    for (var transacao in transacoes) {
      double valor = transacao['valor'];
      total += (transacao['tipo'] == 'Crédito') ? valor : -valor;
    }
    return total;
  }

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetarTransacoes,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Valor',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _atualizarTipoTransacao('Crédito'),
                  child: Text('Crédito'),
                  style: ElevatedButton.styleFrom(
                    primary: _tipoTransacao == 'Crédito' ? Colors.blue : Color.fromARGB(255, 12, 108, 159),
                  ),
                ),
                const SizedBox(width: 60.0),
                ElevatedButton(
                  onPressed: () => _atualizarTipoTransacao('Débito'),
                  child: Text('Débito'),
                  style: ElevatedButton.styleFrom(
                    primary: _tipoTransacao == 'Débito' ? Colors.red : const Color.fromARGB(255, 104, 9, 9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: transacoes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 65.0),
                            Text(
                              transacoes[index]['tipo'],
                              style: TextStyle(
                                color: transacoes[index]['tipo'] == 'Crédito' ? Colors.blue : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20.0),
                            Icon(
                              transacoes[index]['tipo'] == 'Crédito'
                                  ? Icons.add
                                  : Icons.remove,
                              color: transacoes[index]['tipo'] == 'Crédito' ? Colors.blue : Colors.red,
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              'R\$ ${transacoes[index]['valor'].toStringAsFixed(2)}',
                              style: TextStyle(
                                color: transacoes[index]['tipo'] == 'Crédito' ? Colors.blue : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              'R\$ ${_calcularValorTotal().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: _calcularValorTotal() >= 0 ? Colors.blue : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
