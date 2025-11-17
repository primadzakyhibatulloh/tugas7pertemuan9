import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService with ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  final String _validEmail = 'prima@rental.com';
  final String _validPassword = 'H1D023040';

  Future<void> _saveUserToStorage(User user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = user.toJson();
    await prefs.setString('loggedInUser', userJson);
  }

  Future<void> _clearUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('loggedInUser')) {
      return false;
    }

    try {
      final String userJson = prefs.getString('loggedInUser')!;
      _user = User.fromJson(userJson);
      notifyListeners();
      return true;
    } catch (e) {
      await _clearUserFromStorage();
      return false;
    }
  }

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == _validEmail && password == _validPassword) {
      _user = User(
        id: 'u1',
        name: 'Prima',
        email: _validEmail,
        nim: 'H1D023040',
      );

      await _saveUserToStorage(_user!);

      notifyListeners();
    } else {
      throw Exception('Email atau Password salah!');
    }
  }

  Future<void> logout() async {
    _user = null;
    await _clearUserFromStorage();
    notifyListeners();
  }
}