import 'package:fively_ecommerce/utilities/enums.dart';
import 'package:fively_ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(_authType == AuthFormType.login ? 'Login' : 'Register',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(
                  height: 100,
                ),
                if (_authType == AuthFormType.register)
                  TextFormField(
                    controller: _nameController,
                    validator: (value) =>
                        value!.isNotEmpty ? "Please enter your Name" : null,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                    ),
                  ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) =>
                      value!.isNotEmpty ? "Please enter your email" : null,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isNotEmpty ? "Please enter your password" : null,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_authType == AuthFormType.login)
                  InkWell(
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {},
                  ),
                const SizedBox(
                  height: 16,
                ),
                MainButton(
                    text:
                        _authType == AuthFormType.login ? 'Login' : 'Register',
                    onTap: () {}),
                const SizedBox(
                  height: 16,
                ),
                  InkWell(
                    child: Text(
                      _authType == AuthFormType.login?
                      'don\'t have an account? Register':'Already have an account?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                const Spacer(),
                Text(
                  _authType == AuthFormType.login
                      ? 'or Login with'
                      : 'or Register with',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
