#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

/*######
## spell_argent_cannon

DELETE FROM `spell_script_names` WHERE `spell_id` IN (57385, 57387, 57412, 57414);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(57385, 'spell_argent_cannon'),
(57387, 'spell_argent_cannon'),
(57412, 'spell_argent_cannon'),
(57414, 'spell_argent_cannon');

######*/

enum ArgentCannonSpells
{
    SPELL_ARGENT_CANNON_SHOOT           = 57385,
    SPELL_ARGENT_CANNON_SHOOT_TRIGGER   = 57387,
    SPELL_RECONING_BOMB                 = 57412,
    SPELL_RECONING_BOMB_TRIGGER         = 57414
};

class spell_argent_cannon : public SpellScriptLoader
{
public:
    spell_argent_cannon() : SpellScriptLoader("spell_argent_cannon") { }

    class spell_argent_cannon_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_argent_cannon_SpellScript);

        bool Validate(SpellEntry const* /*spellInfo*/)
        {
            if (!sSpellStore.LookupEntry(SPELL_ARGENT_CANNON_SHOOT_TRIGGER))
                return false;
            if (!sSpellStore.LookupEntry(SPELL_RECONING_BOMB_TRIGGER))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex effIndex)
        {
            const WorldLocation* loc = GetTargetDest();

            switch(GetSpellInfo()->Id)
            {
            case SPELL_ARGENT_CANNON_SHOOT:
                GetCaster()->CastSpell(loc->m_positionX, loc->m_positionY, loc->m_positionZ, SPELL_ARGENT_CANNON_SHOOT_TRIGGER , true);
                break;
            case SPELL_RECONING_BOMB:
                GetCaster()->CastSpell(loc->m_positionX, loc->m_positionY, loc->m_positionZ, SPELL_RECONING_BOMB_TRIGGER , true);
                break;
            }

            PreventHitDefaultEffect(effIndex);
        }

        void Register()
        {
            //OnEffect += SpellEffectFn(spell_argent_cannon_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            OnEffect += SpellEffectFn(spell_argent_cannon_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_argent_cannon_SpellScript();
    }
};

void AddSC_custom_spell()
{
    new spell_argent_cannon;
}
