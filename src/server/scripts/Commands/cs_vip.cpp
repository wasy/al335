/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
Name: vip_commandscript
%Complete:
Comment: All vip related commands
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "AccountMgr.h"
#include "Chat.h"

class vip_commandscript : public CommandScript
{
public:
    vip_commandscript() : CommandScript("vip_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand vipCommandTable[] =
        {
            { "add",            SEC_GAMEMASTER,     true,  &HandleVIPAddCommand,              "", NULL },
            { "",               SEC_PLAYER,         true,  &HandleVIPCommand,                 "", NULL },
            { NULL,             0,                  false, NULL,                              "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "vip",            SEC_PLAYER,         false, NULL,                    "", vipCommandTable },
            { NULL,             0,                  false, NULL,                               "", NULL }
        };
        return commandTable;
    }

    static bool HandleVIPAddCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        ///- Get the command line arguments
        char* account = strtok ((char*)args, " ");
        char* duration = strtok (NULL," ");

        if (!account || !duration || !atoi(duration))
            return false;

        std::string account_name = account;
        uint32 duration_secs = atoi(duration) * 86400;
        std::string gm = handler->GetSession()->GetPlayerName();

        if (!AccountMgr::normalizeString(account_name))
        {
            handler->PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
            handler->SetSentErrorMessage(true);
            return false;
        }

        uint32 targetAccountId = AccountMgr::GetId(account_name);

        if (!targetAccountId)
        {
            handler->PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
            handler->SetSentErrorMessage(true);
            return false;
        }

        /// can set vip only for target with less security
        /// This is also reject self apply in fact
        if (handler->HasLowerSecurityAccount (NULL, targetAccountId, true))
            return false;

        QueryResult resultLogin = LoginDatabase.PQuery("SELECT active FROM account_vip WHERE id = %u AND active = 1", targetAccountId);
        if (resultLogin)
        {
            LoginDatabase.PExecute("UPDATE account_vip "
            "SET gm = '%s', unsetdate = unsetdate + %u "
            "WHERE id = %u", gm.c_str(), duration_secs, targetAccountId);

            handler->PSendSysMessage("VIP обновляется.");

            return true;
        }

        LoginDatabase.PExecute("DELETE FROM account_vip WHERE id = %u", targetAccountId);

        LoginDatabase.PExecute("INSERT INTO account_vip "
        "(id, gm, setdate, unsetdate, active) "
        "VALUES ('%u', '%s', UNIX_TIMESTAMP(), UNIX_TIMESTAMP() + %u, 1)",
        targetAccountId, gm.c_str(), duration_secs);

        handler->PSendSysMessage("VIP успешно установлен.");

        return true;
    }

    static bool HandleVIPCommand(ChatHandler* handler, const char* args)
    {
        uint32 accountId;

        AccountTypes level = handler->GetSession()->GetSecurity();
        if (uint32(level) > 0)
        {
            if (!*args)
                return false;

            char *szAcc = strtok((char*)args, " ");
            std::string account_name = szAcc;

            if (!AccountMgr::normalizeString(account_name))
            {
                handler->PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
                handler->SetSentErrorMessage(true);
                return false;
            }

            accountId = AccountMgr::GetId(account_name);
            if (!accountId)
            {
                handler->PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
                handler->SetSentErrorMessage(true);
                return false;
            }
        }
        else
            accountId = handler->GetSession()->GetAccountId();

        QueryResult resultLogin = LoginDatabase.PQuery("SELECT DATEDIFF(FROM_UNIXTIME(unsetdate), NOW()) FROM account_vip WHERE id = %u AND active = 1", accountId);

        if (!resultLogin)
            handler->PSendSysMessage("[VIP] Эта учетная запись не VIP.");
        else
        {
            uint32 days = (*resultLogin)[0].GetUInt32();
            handler->PSendSysMessage("[VIP] VIP истекает %u д.", days);
        }

        return true;
    }
};

void AddSC_vip_commandscript()
{
    new vip_commandscript();
}
