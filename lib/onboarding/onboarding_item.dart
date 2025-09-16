class OnboardingItem {
  String backgroundImage;
  String title;
  String? description;
  String? mainButtonText;
  String? backButtonText;
  bool inContainer;

  OnboardingItem({
    required this.backgroundImage,
    required this.title,
    this.description,
    this.mainButtonText,
    this.backButtonText,
    this.inContainer = true,
  });
}
