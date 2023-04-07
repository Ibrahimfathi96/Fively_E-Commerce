import 'package:fively_ecommerce/utilities/enums.dart';
import 'package:fively_ecommerce/utilities/routes.dart';
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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();

  var _authType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(_authType == AuthFormType.login ? 'Login' : 'Register',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // ),
                  if (_authType == AuthFormType.register)
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_emailFocusNode),
                      focusNode: _nameFocusNode,
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
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your email" : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocusNode,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your password" : null,
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
                      text: _authType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.bottomNavBarRouteName);
                          debugPrint('Authenticated');
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    child: Text(
                      _authType == AuthFormType.login
                          ? 'Don\'t have an account? Register'
                          : 'Already have an account?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                  // const Spacer(),
                  _authType == AuthFormType.register
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.11,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                        ),
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
      ),
    );
  }
}
