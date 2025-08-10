import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'MoneyQuest'**
  String get appTitle;

  /// No description provided for @tabLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get tabLearn;

  /// No description provided for @tabPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get tabPlay;

  /// No description provided for @tabProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get tabProgress;

  /// No description provided for @tabGrownups.
  ///
  /// In en, this message translates to:
  /// **'Grown-ups'**
  String get tabGrownups;

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @playTitle.
  ///
  /// In en, this message translates to:
  /// **'Playground'**
  String get playTitle;

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTitle;

  /// No description provided for @grownupsTitle.
  ///
  /// In en, this message translates to:
  /// **'Grown-ups'**
  String get grownupsTitle;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'A kid-friendly app teaching money basics. No ads. No tracking.'**
  String get aboutApp;

  /// No description provided for @xpLabel.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get xpLabel;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'More coming soon.'**
  String get comingSoon;

  /// No description provided for @needsWantsTitle.
  ///
  /// In en, this message translates to:
  /// **'Needs vs. Wants'**
  String get needsWantsTitle;

  /// No description provided for @needsWantsSummary.
  ///
  /// In en, this message translates to:
  /// **'Learn to tell needs from wants to spend wisely.'**
  String get needsWantsSummary;

  /// No description provided for @nw_card1.
  ///
  /// In en, this message translates to:
  /// **'Needs are things you must have to live, like water or shelter.'**
  String get nw_card1;

  /// No description provided for @nw_card2.
  ///
  /// In en, this message translates to:
  /// **'Wants are nice-to-have things, like toys or candy.'**
  String get nw_card2;

  /// No description provided for @nw_q1.
  ///
  /// In en, this message translates to:
  /// **'Which one is a need?'**
  String get nw_q1;

  /// No description provided for @nw_q1_c1.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get nw_q1_c1;

  /// No description provided for @nw_q1_c2.
  ///
  /// In en, this message translates to:
  /// **'Candy'**
  String get nw_q1_c2;

  /// No description provided for @nw_q1_c3.
  ///
  /// In en, this message translates to:
  /// **'Video game'**
  String get nw_q1_c3;

  /// No description provided for @nw_q2.
  ///
  /// In en, this message translates to:
  /// **'Which is a want?'**
  String get nw_q2;

  /// No description provided for @nw_q2_c1.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get nw_q2_c1;

  /// No description provided for @nw_q2_c2.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get nw_q2_c2;

  /// No description provided for @nw_q2_c3.
  ///
  /// In en, this message translates to:
  /// **'New shoes (you already have some)'**
  String get nw_q2_c3;

  /// No description provided for @savingBasicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Saving Basics'**
  String get savingBasicsTitle;

  /// No description provided for @savingBasicsSummary.
  ///
  /// In en, this message translates to:
  /// **'Small amounts add up over time.'**
  String get savingBasicsSummary;

  /// No description provided for @sb_card1.
  ///
  /// In en, this message translates to:
  /// **'Saving means keeping some money now so you can use it later.'**
  String get sb_card1;

  /// No description provided for @sb_q1.
  ///
  /// In en, this message translates to:
  /// **'Where should you put saved money?'**
  String get sb_q1;

  /// No description provided for @sb_q1_c1.
  ///
  /// In en, this message translates to:
  /// **'Spend it all immediately'**
  String get sb_q1_c1;

  /// No description provided for @sb_q1_c2.
  ///
  /// In en, this message translates to:
  /// **'Keep it in a safe place'**
  String get sb_q1_c2;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
