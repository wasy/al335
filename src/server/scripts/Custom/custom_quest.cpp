#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

/*
-- SQL Changes Needed
UPDATE creature_template SET ScriptName = 'npc_blessed_banner' WHERE entry = 30891;
UPDATE creature_template SET faction_A = 2068, faction_H = 2068 WHERE entry IN (30986, 30984, 30987, 30989);
UPDATE creature_template SET faction_A = 2131, faction_H = 2131 WHERE entry IN (31003, 30919, 30900);

DELETE FROM event_scripts WHERE id = 20082;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(20082, 2, 7, 13141, 0, 0, 0, 0, 0, 0),
(20082, 0, 10, 30891, 600000, 0, 6418.31, 423, 511.2, 5.945);
*/

enum BlessedBannerSpells
{
    SPELL_BLESSING_OF_THE_CRUSADE = 58026,
    SPELL_CRUSADERS_SPIRE_VICTORY = 58084,
};

enum BlessedBannerSummondNPCs
{
    ENTRY_BLESSED_BANNER = 30891,

    ENTRY_CRUSADER_LORD_DALFORS = 31003,
    ENTRY_ARGENT_BATTLE_PRIEST = 30919,
    ENTRY_ARGENT_MASON = 30900,

    ENTRY_REANIMATED_CAPTAIN = 30986,
    ENTRY_SCOURGE_DRUDGE = 30984,
    ENTRY_HIDEOUS_PLAGEBRINGER = 30987,
    ENTRY_HALOF_THE_DEATHBRINGER = 30989,
};


const Position CrusaderPos[8] =
{
    {6418.31f, 423.00f, 511.2f, 5.945f}, // Banner

    {6424.50f, 420.72f, 511.0f, 5.689f}, // Dalfors
    {6421.05f, 423.37f, 511.0f, 5.579f}, // Priest 1
    {6423.25f, 425.95f, 511.0f, 5.579f}, // Priest 2
    {6417.59f, 419.28f, 511.0f, 5.579f}, // Priest 3

    {6418.36f, 439.71f, 511.28f, 3.757f}, // Matron 1
    {6406.75f, 475.36f, 511.27f, 2.928f}, // Matron 2
    {6386.99f, 440.60f, 511.28f, 2.601f} // Matron 3
};

const Position ScourgePos =
{
    6460.16f, 403.45f, 490.07f, 2.700f //Scourge Spawn
};

#define SAY_PRE_1 "BY THE LIGHT! Those damned monsters! Look at what they've done to our people!"
#define SAY_PRE_2 "Burn it down, boys. Burn it all down."
#define SAY_START "Let 'em come. They'll pay for what they've done!"
#define YELL_FINISHED "We've done it, lads! We've taken the pinnacle from the Scourge! Report to Father Gustav at once and tell him the good news! We're gonna get to buildin' and settin' up! Go!"

// Script for Battle for Crusaders' Pinnacle Controller
class npc_blessed_banner : public CreatureScript
{
public:
    npc_blessed_banner() : CreatureScript("npc_blessed_banner") { }

    struct npc_blessed_bannerAI : public Scripted_NoMovementAI
    {
        npc_blessed_bannerAI(Creature* creature) : Scripted_NoMovementAI(creature), Summons(me)
        {
            EventStarted = false;
            EventFinished = false;
            PhaseCount = 0;
            uiSummon_Timer = 0;
            say_Timer = 0;
            says = 0;
            Summons.DespawnAll();
        }

        bool EventStarted;
        bool EventFinished;

        uint32 PhaseCount;
        uint32 uiSummon_Timer;
        uint32 say_Timer;
        uint32 says;

        SummonList Summons;

        uint64 guidHalof;

        void Reset()
        {
            std::list<Creature*> _banners;
            GetCreatureListWithEntryInGrid(_banners, me, ENTRY_BLESSED_BANNER, 100.0f);
            if (!_banners.empty())
                for (std::list<Creature*>::iterator iter = _banners.begin(); iter != _banners.end(); ++iter)
                {
                    if((*iter)->GetGUID() != me->GetGUID())
                    {
                        EventFinished = true;
                        me->DespawnOrUnsummon(0);
                        Summons.DespawnAll();
                        return;
                    }
                }
        }

        void MoveInLineOfSight(Unit *attacker)
        {
            return;
        }

        void JustSummoned(Creature* pSummoned)
        {
            Summons.Summon(pSummoned);
        }

        void JustDied(Unit *killer)
        {
            Summons.DespawnAll();
        }

        void UpdateAI(const uint32 diff)
        {
            if(EventFinished)
                return;

            if(!EventStarted)
            {
                Creature *tempsum;

                if(tempsum = DoSummon(ENTRY_CRUSADER_LORD_DALFORS, ScourgePos, 600000, TEMPSUMMON_TIMED_DESPAWN))
                {
                    tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[1]);
                    tempsum->SetHomePosition(CrusaderPos[1]);
                }

                for(int i = 0; i < 3; i++)
                {
                    if(tempsum = DoSummon(ENTRY_ARGENT_MASON, ScourgePos, 600000, TEMPSUMMON_TIMED_DESPAWN))
                    {
                        tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[5+i]);
                        tempsum->SetHomePosition(CrusaderPos[5+i]);
                    }
                }

                for(int i = 0; i < 3; i++)
                {
                    if(tempsum = DoSummon(ENTRY_ARGENT_BATTLE_PRIEST, ScourgePos, 600000, TEMPSUMMON_TIMED_DESPAWN))
                    {
                        tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[2+i]);
                        tempsum->SetHomePosition(CrusaderPos[2+i]);
                    }
                }

                DoCast(SPELL_BLESSING_OF_THE_CRUSADE);
                uiSummon_Timer = 30000;
                EventStarted = true;
            }else
            {
                if(says < 3)
                    if(say_Timer <= diff)
                    {
                        switch(says)
                        {
                        case 0:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me, ENTRY_CRUSADER_LORD_DALFORS, 100, true))
                                dalfors->MonsterSay(SAY_PRE_1, LANG_UNIVERSAL, NULL);
                            say_Timer = 10000;
                            break;
                        case 1:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me, ENTRY_CRUSADER_LORD_DALFORS, 100, true))
                                dalfors->MonsterSay(SAY_PRE_2, LANG_UNIVERSAL, NULL);

                            say_Timer = 10000;
                            break;
                        case 2:
                            if(Creature* dalfors = GetClosestCreatureWithEntry(me, ENTRY_CRUSADER_LORD_DALFORS, 100, true))
                                dalfors->MonsterSay(SAY_START, LANG_UNIVERSAL, NULL);

                            say_Timer = 10000;
                            break;
                        }
                        says++;

                    }else say_Timer -= diff;


                if(uiSummon_Timer <= diff)
                {
                    if(PhaseCount == 9)
                    {
                        Creature *tempsum;

                        if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                        if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                        if(tempsum = DoSummon(ENTRY_HALOF_THE_DEATHBRINGER, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                        {
                            guidHalof = tempsum->GetGUID();
                            tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0]);
                            tempsum->SetHomePosition(CrusaderPos[0]);
                        }
                    }else
                    {
                        Creature *tempsum;

                        if(urand(0, 1) == 0)
                        {
                            if(tempsum = DoSummon(ENTRY_HIDEOUS_PLAGEBRINGER, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_HIDEOUS_PLAGEBRINGER, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                        }
                        else
                        {
                            if(tempsum = DoSummon(ENTRY_REANIMATED_CAPTAIN, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_REANIMATED_CAPTAIN, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                            if(tempsum = DoSummon(ENTRY_SCOURGE_DRUDGE, ScourgePos, 10000, TEMPSUMMON_CORPSE_TIMED_DESPAWN))
                            {
                                tempsum->GetMotionMaster()->MovePoint(0, CrusaderPos[0].m_positionX - 10 + urand(0, 10), CrusaderPos[0].m_positionY - 10 + urand(0, 10), CrusaderPos[0].m_positionZ );
                                tempsum->SetHomePosition(CrusaderPos[0]);
                            }
                        }

                    }

                    PhaseCount++;
                    uiSummon_Timer = 20000;
                }else uiSummon_Timer -= diff;

                if(PhaseCount > 8)
                {
                    if(Creature* Halof = me->GetCreature(*me, guidHalof))
                    {
                        if(Halof->isDead())
                        {
                            EventFinished = true;
                            DoCast(me, SPELL_CRUSADERS_SPIRE_VICTORY, true);

                            Summons.DespawnEntry(ENTRY_HIDEOUS_PLAGEBRINGER);
                            Summons.DespawnEntry(ENTRY_REANIMATED_CAPTAIN);
                            Summons.DespawnEntry(ENTRY_SCOURGE_DRUDGE);
                            Summons.DespawnEntry(ENTRY_HALOF_THE_DEATHBRINGER);

                            if(Creature* dalfors = GetClosestCreatureWithEntry(me, ENTRY_CRUSADER_LORD_DALFORS, 100, true))
                                dalfors->MonsterYell(YELL_FINISHED, LANG_UNIVERSAL, NULL);

                            for(std::list<uint64>::iterator itr = Summons.begin(); itr != Summons.end(); ++itr)
                            {
                                if(Creature* temp = Creature::GetCreature(*me, *itr))
                                {
                                    temp->DespawnOrUnsummon(20000);
                                }
                            }

                            me->DespawnOrUnsummon(20000);
                        }
                    }
                }
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_blessed_bannerAI(creature);
    }

};

void AddSC_custom_quest()
{
    new npc_blessed_banner;
}
