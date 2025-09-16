import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/home.dart';
import 'package:movie/shared/app_theme.dart';
import '../../../auth/login_screen.dart';
import '../../../form_validators.dart';
import '../../../l10n/app_localizations.dart';
import '../../../language_provider.dart';
import '../../../language_switch_row.dart';
import '../../../loading_indicator.dart';
import '../../../shared/defualt_elevated_button.dart';
import '../../../shared/defualt_text_form.dart';
import '../../data/data_sources/register_remote_data_source.dart';
import '../../data/repositories/register_repository_impl.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routename="register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  int selectedAvatarId = 1;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
          RegisterCubit(RegisterRepository(RegisterRemoteDataSource())),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account Created Successfully")),
            );
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.backgrounddark,
              centerTitle: true,
              title: Text(AppLocalizations.of(context)!.register),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            child: CarouselSlider(
                              items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedAvatarId = i;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/avatar_$i.png',
                                    height: MediaQuery.sizeOf(context).height * 0.1,
                                    width: MediaQuery.sizeOf(context).width * 0.4,
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                enableInfiniteScroll: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.55,
                                viewportFraction: 0.37,
                              ),
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.avatar,
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          DefualtTextForm(
                            controller: nameController,
                            hintText: AppLocalizations.of(context)!.name,
                            prefixIconImageName: 'name',
                            volditer: FormValidators.validateName,
                          ),
                          const SizedBox(height: 20),
                          DefualtTextForm(
                            controller: emailController,
                            hintText: AppLocalizations.of(context)!.email,
                            prefixIconImageName: 'email',
                            volditer: FormValidators.validateEmail,
                          ),
                          const SizedBox(height: 20),
                          DefualtTextForm(
                            controller: passwordController,
                            isPassword: true,
                            hintText: AppLocalizations.of(context)!.password,
                            prefixIconImageName: 'password',
                            volditer: FormValidators.validatePassword,
                          ),
                          const SizedBox(height: 20),
                          DefualtTextForm(
                            controller: confirmPasswordController,
                            isPassword: true,
                            hintText: AppLocalizations.of(context)!.confirmPassword,
                            prefixIconImageName: 'password',
                            volditer: (value) =>
                                FormValidators.validateConfirmPassword(
                                  value,
                                  passwordController.text,
                                ),
                          ),
                          const SizedBox(height: 20),
                          DefualtTextForm(
                            controller: phoneController,
                            hintText: AppLocalizations.of(context)!.phone,
                            prefixIconImageName: 'phone',
                            volditer: FormValidators.validatePhone,
                          ),
                          const SizedBox(height: 20),
                          DefualtElevatedButton(
                            label: "Create Account",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<RegisterCubit>().register(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text,
                                  phoneController.text.trim(),
                                  selectedAvatarId,
                                );
                              }
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.alreadyHaveAccount,
                                style: textTheme.titleSmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pushNamed(LoginScreen.routeName);
                                },
                                child: Text(AppLocalizations.of(context)!.login),
                              ),
                            ],
                          ),
                          LanguageSwitchRow(
                            currentLang: languageProvider.locale.languageCode,
                            onSelect: (lang) =>
                                languageProvider.changeLanguage(lang),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is RegisterLoading)
                    LoadingIndicator()
                ],
              )
            ),
          );
        },
      ),
    );
  }
}
