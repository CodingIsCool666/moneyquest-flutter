import 'package:moneyquest/l10n/app_localizations.dart';

/// Map JSON string keys -> generated l10n getters.
/// Add new cases here whenever you add keys to your .arb files.
String t(AppLocalizations l10n, String key) {
  switch (key) {
    // Lesson titles & summaries
    case 'needsWantsTitle': return l10n.needsWantsTitle;
    case 'needsWantsSummary': return l10n.needsWantsSummary;
    case 'savingBasicsTitle': return l10n.savingBasicsTitle;
    case 'savingBasicsSummary': return l10n.savingBasicsSummary;

    // Cards
    case 'nw_card1': return l10n.nw_card1;
    case 'nw_card2': return l10n.nw_card2;
    case 'sb_card1': return l10n.sb_card1;

    // Quiz prompts & choices (Needs vs Wants)
    case 'nw_q1': return l10n.nw_q1;
    case 'nw_q1_c1': return l10n.nw_q1_c1;
    case 'nw_q1_c2': return l10n.nw_q1_c2;
    case 'nw_q1_c3': return l10n.nw_q1_c3;

    case 'nw_q2': return l10n.nw_q2;
    case 'nw_q2_c1': return l10n.nw_q2_c1;
    case 'nw_q2_c2': return l10n.nw_q2_c2;
    case 'nw_q2_c3': return l10n.nw_q2_c3;

    // Quiz (Saving Basics)
    case 'sb_q1': return l10n.sb_q1;
    case 'sb_q1_c1': return l10n.sb_q1_c1;
    case 'sb_q1_c2': return l10n.sb_q1_c2;

    default:
      return key; // fallback shows the key if unmapped (useful during dev)
  }
}
