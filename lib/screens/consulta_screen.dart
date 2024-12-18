import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgendamentoConsultaScreen extends StatefulWidget {
  @override
  _AgendamentoConsultaScreenState createState() =>
      _AgendamentoConsultaScreenState();
}

class _AgendamentoConsultaScreenState extends State<AgendamentoConsultaScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedDoctor;

  final List<String> _doctors = [
    'Dra. Ana Clara',
    'Dr. Pedro Silva',
    'Dra. Camila Costa',
    'Dr. Rafael Mendes'
  ];

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  void _confirmarAgendamento() {
    if (_selectedDate == null ||
        _selectedTime == null ||
        _selectedDoctor == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Erro"),
          content: Text("Por favor, preencha todos os campos!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Lógica para salvar o agendamento
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Agendamento Confirmado"),
          content: Text(
              "Consulta com $_selectedDoctor em ${DateFormat('dd/MM/yyyy').format(_selectedDate!)} às ${_selectedTime!.format(context)}"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agendar Consulta",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Selecione o médico"),
              items: _doctors.map((doctor) {
                return DropdownMenuItem(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDoctor = value;
                });
              },
              value: _selectedDoctor,
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(_selectedDate == null
                  ? "Selecione uma data"
                  : "Data: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}"),
              trailing: Icon(Icons.calendar_month_outlined),
              onTap: () => _pickDate(context),
            ),
            ListTile(
              title: Text(_selectedTime == null
                  ? "Selecione um horário"
                  : "Horário: ${_selectedTime!.format(context)}"),
              trailing: Icon(Icons.access_time),
              onTap: () => _pickTime(context),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _confirmarAgendamento,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Color(0xFF5896E8),
              ),
              child: Text(
                "Confirmar Agendamento",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
