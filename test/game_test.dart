import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bicak_firlatma/oyun_bicak_firlatma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bicakConfig.title.length, 33);
    expect(bicakConfig.tagline.length, 33);
    for (final s in bicakConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bicakRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bicakId, optionalMechanics: bicakRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bicakRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
