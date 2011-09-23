#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

/*######
## at_brewfest

-- Areatrigger scriptname
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (4829,4820);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(4829,'at_brewfest'), -- Durotar
(4820,'at_brewfest'); -- Dun Morogh

######*/

enum Brewfest
{
    NPC_TAPPER_SWINDLEKEG      = 24711,
    NPC_IPFELKOFER_IRONKEG     = 24710,

    AT_BREWFEST_DUROTAR        = 4829,
    AT_BREWFEST_DUN_MOROGH     = 4820,

    SAY_WELCOME                = 1,

    AREATRIGGER_TALK_COOLDOWN  = 5, // in seconds
};

class AreaTrigger_at_brewfest : public AreaTriggerScript
{
    public:
        AreaTrigger_at_brewfest() : AreaTriggerScript("at_brewfest")
        {
            // Initialize for cooldown
            _triggerTimes[AT_BREWFEST_DUROTAR] = _triggerTimes[AT_BREWFEST_DUN_MOROGH] = 0;
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
        {
            uint32 triggerId = trigger->id;
            // Second trigger happened too early after first, skip for now
            if (sWorld->GetGameTime() - _triggerTimes[triggerId] < AREATRIGGER_TALK_COOLDOWN)
                return false;

                switch (triggerId)
                {
                    case AT_BREWFEST_DUROTAR:
                        if (Creature* tapper = player->FindNearestCreature(NPC_TAPPER_SWINDLEKEG, 20.0f))
                            tapper->AI()->Talk(SAY_WELCOME, player->GetGUID());
                        break;
                    case AT_BREWFEST_DUN_MOROGH:
                        if (Creature* ipfelkofer = player->FindNearestCreature(NPC_IPFELKOFER_IRONKEG, 20.0f))
                            ipfelkofer->AI()->Talk(SAY_WELCOME, player->GetGUID());
                        break;
                    default:
                        break;
                }

            _triggerTimes[triggerId] = sWorld->GetGameTime();
            return false;
        }

    private:
        std::map<uint32, time_t> _triggerTimes;
};

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
    new AreaTrigger_at_brewfest();
    new spell_argent_cannon();
}
