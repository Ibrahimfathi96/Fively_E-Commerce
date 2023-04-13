import 'package:fively_ecommerce/controllers/auth_controller.dart';
import 'package:fively_ecommerce/utilities/enums.dart';
import 'package:fively_ecommerce/utilities/routes.dart';
import 'package:fively_ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model)async{
    try{
      await model.submit();
      if(!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.landingPageRouteName);
    }catch(ex){
      showDialog(context: context, builder: (context) =>AlertDialog(
        title: Text('Error!',style: Theme.of(context).textTheme.headlineSmall,),
        content: Text(ex.toString(),style: Theme.of(context).textTheme.titleMedium,),
        actions: [
          TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: const Text('OK'),
          ),
        ],
      ) ,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 46, horizontal: 32),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      // const SizedBox(
                      //   height: 100,
                      // ),
                      // if (model.authFormType == AuthFormType.register)
                      //   TextFormField(
                      //     textInputAction: TextInputAction.next,
                      //     onEditingComplete: () => FocusScope.of(context)
                      //         .requestFocus(_emailFocusNode),
                      //     focusNode: _nameFocusNode,
                      //     controller: _nameController,
                      //     validator: (value) => value!.isNotEmpty
                      //         ? "Please enter your Name"
                      //         : null,
                      //     decoration: const InputDecoration(
                      //       labelText: 'Name',
                      //       hintText: 'Enter your name',
                      //     ),
                      //   ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      TextFormField(
                        onChanged: model.updateEmail,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
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
                        onChanged: model.updatePassword,
                        textInputAction: TextInputAction.done,
                        focusNode: _passwordFocusNode,
                        validator: (value) => value!.isEmpty
                            ? "Please enter your password"
                            : null,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (model.authFormType == AuthFormType.login)
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
                          text: model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Register',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            }
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'Don\'t have an account? Register'
                              : 'Already have an account?',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () {
                          _formKey.currentState!.reset();
                          model.toggleFormType();
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                      Text(
                        model.authFormType == AuthFormType.login
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
      },
    );
  }
}
