import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../models/motor.dart';
import '../services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Motor> _motorList = [
    Motor(id: 'm1', nama: 'Honda Vario 160', tipe: 'Matic', hargaSewa: 80000),
    Motor(id: 'm2', nama: 'Yamaha NMAX', tipe: 'Matic', hargaSewa: 100000),
    Motor(id: 'm3', nama: 'Honda PCX', tipe: 'Matic', hargaSewa: 100000),
    Motor(id: 'm4', nama: 'Kawasaki KLX 150', tipe: 'Trail', hargaSewa: 120000),
    Motor(id: 'm5', nama: 'Honda CBR 150R', tipe: 'Sport', hargaSewa: 150000),
  ];

  @override
  Widget build(BuildContext context) {
    final String? userName = Provider.of<AuthService>(context).user?.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Rental'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang,',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.grey[400],
                  ),
            ),
            Text(
              '${userName ?? 'User'}!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Motor Tersedia',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            
            Expanded(
              child: ListView.builder(
                itemCount: _motorList.length,
                itemBuilder: (ctx, index) {
                  final motor = _motorList[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: Icon(
                        motor.tipe == 'Matic' ? Icons.moped : Icons.sports_motorsports,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      title: Text(motor.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Tipe: ${motor.tipe}'),
                      trailing: Text(
                        'Rp ${motor.hargaSewa}/hari',
                        style: TextStyle(
                          color: Colors.greenAccent[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}