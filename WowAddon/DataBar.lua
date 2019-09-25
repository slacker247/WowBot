local this = nil;
local frame = nil;
local events = {[0] = "ACHIEVEMENT_EARNED",
[1] = "ACTIONBAR_HIDEGRID",
[2] = "ACTIONBAR_PAGE_CHANGED",
[3] = "ACTIONBAR_SHOWGRID",
[4] = "ACTIONBAR_SLOT_CHANGED",
[5] = "ACTIONBAR_UPDATE_COOLDOWN",
[6] = "ACTIONBAR_UPDATE_STATE",
[7] = "ACTIONBAR_UPDATE_USABLE",
[8] = "ACTIVE_TALENT_GROUP_CHANGED",
[9] = "ADDON_ACTION_BLOCKED",
[10] = "ADDON_ACTION_FORBIDDEN",
[12] = "ADDON_LOADED",
[13] = "AREA_SPIRIT_HEALER_IN_RANGE",
[14] = "AREA_SPIRIT_HEALER_OUT_OF_RANGE",
[15] = "ARENA_OPPONENT_UPDATE",
[16] = "ARENA_SEASON_WORLD_STATE",
[17] = "ARENA_TEAM_INVITE_REQUEST",
[18] = "ARENA_TEAM_ROSTER_UPDATE",
[19] = "ARENA_TEAM_UPDATE",
[20] = "AUCTION_BIDDER_LIST_UPDATE",
[21] = "AUCTION_HOUSE_CLOSED",
[22] = "AUCTION_HOUSE_SHOW",
[23] = "AUCTION_ITEM_LIST_UPDATE",
[24] = "AUCTION_OWNED_LIST_UPDATE",
[25] = "AUTOEQUIP_BIND_CONFIRM",
[26] = "AUTOFOLLOW_BEGIN",
[27] = "AUTOFOLLOW_END",
[28] = "BAG_CLOSED",
[29] = "BAG_OPEN",
[30] = "BAG_UPDATE",
[31] = "BAG_UPDATE_COOLDOWN",
[32] = "BANKFRAME_CLOSED",
[33] = "BANKFRAME_OPENED",
[34] = "BARBER_SHOP_APPEARANCE_APPLIED",
[35] = "BARBER_SHOP_CLOSE",
[36] = "BARBER_SHOP_OPEN",
[37] = "BARBER_SHOP_SUCCESS",
[38] = "BATTLEFIELDS_CLOSED",
[39] = "BATTLEFIELDS_SHOW",
[40] = "BATTLEFIELD_MGR_EJECTED",
[41] = "BATTLEFIELD_MGR_EJECT_PENDING",
[42] = "BATTLEFIELD_MGR_ENTERED",
[43] = "BATTLEFIELD_MGR_ENTRY_INVITE",
[44] = "BATTLEFIELD_MGR_QUEUE_INVITE",
[45] = "BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE",
[46] = "BATTLEFIELD_MGR_STATE_CHANGE",
[47] = "BILLING_NAG_DIALOG",
[48] = "BIND_ENCHANT",
[49] = "CALENDAR_ACTION_PENDING",
[50] = "CALENDAR_CLOSE_EVENT",
[51] = "CALENDAR_EVENT_ALARM",
[52] = "CALENDAR_GUILD_RANKS",
[53] = "CALENDAR_NEW_EVENT",
[54] = "CALENDAR_OPEN_EVENT",
[55] = "CALENDAR_UPDATE_ERROR",
[56] = "CALENDAR_UPDATE_EVENT",
[57] = "CALENDAR_UPDATE_EVENT_LIST",
[58] = "CALENDAR_UPDATE_INVITE_LIST",
[59] = "CALENDAR_UPDATE_PENDING_INVITES",
[60] = "CANCEL_LOOT_ROLL",
[61] = "CANCEL_SUMMON",
[62] = "CHANNEL_COUNT_UPDATE",
[63] = "CHANNEL_FLAGS_UPDATED",
[64] = "CHANNEL_INVITE_REQUEST",
[65] = "CHANNEL_PASSWORD_REQUEST",
[66] = "CHANNEL_ROSTER_UPDATE",
[67] = "CHANNEL_UI_UPDATE",
[68] = "CHANNEL_VOICE_UPDATE",
[69] = "CHARACTER_POINTS_CHANGED",
[70] = "CHAT_MSG_ACHIEVEMENT",
[71] = "CHAT_MSG_ADDON",
[72] = "CHAT_MSG_AFK",
[73] = "CHAT_MSG_BATTLEGROUND",
[74] = "CHAT_MSG_BATTLEGROUND_LEADER",
[75] = "CHAT_MSG_BG_SYSTEM_ALLIANCE",
[76] = "CHAT_MSG_BG_SYSTEM_HORDE",
[77] = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
[78] = "CHAT_MSG_BN",
[79] = "CHAT_MSG_CHANNEL",
[80] = "CHAT_MSG_CHANNEL_JOIN",
[81] = "CHAT_MSG_CHANNEL_LEAVE",
[82] = "CHAT_MSG_CHANNEL_LIST",
[83] = "CHAT_MSG_CHANNEL_NOTICE",
[84] = "CHAT_MSG_CHANNEL_NOTICE_USER",
[85] = "CHAT_MSG_COMBAT_FACTION_CHANGE",
[86] = "CHAT_MSG_COMBAT_HONOR_GAIN",
[87] = "CHAT_MSG_COMBAT_MISC_INFO",
[88] = "CHAT_MSG_COMBAT_XP_GAIN",
[89] = "CHAT_MSG_DND",
[90] = "CHAT_MSG_EMOTE",
[91] = "CHAT_MSG_FILTERED",
[92] = "CHAT_MSG_GUILD",
[93] = "CHAT_MSG_GUILD_ACHIEVEMENT",
[94] = "CHAT_MSG_IGNORED",
[95] = "CHAT_MSG_LOOT",
[96] = "CHAT_MSG_MONEY",
[97] = "CHAT_MSG_MONSTER_EMOTE",
[98] = "CHAT_MSG_MONSTER_PARTY",
[99] = "CHAT_MSG_MONSTER_SAY",
[100] = "CHAT_MSG_MONSTER_WHISPER",
[101] = "CHAT_MSG_MONSTER_YELL",
[102] = "CHAT_MSG_OFFICER",
[103] = "CHAT_MSG_OPENING",
[104] = "CHAT_MSG_PARTY",
[105] = "CHAT_MSG_PET_INFO",
[106] = "CHAT_MSG_RAID",
[107] = "CHAT_MSG_RAID_BOSS_EMOTE",
[108] = "CHAT_MSG_RAID_BOSS_WHISPER",
[109] = "CHAT_MSG_RAID_LEADER",
[110] = "CHAT_MSG_RAID_WARNING",
[111] = "CHAT_MSG_RESTRICTED",
[112] = "CHAT_MSG_SAY",
[113] = "CHAT_MSG_SKILL",
[114] = "CHAT_MSG_SYSTEM",
[115] = "CHAT_MSG_TEXT_EMOTE",
[116] = "CHAT_MSG_TRADESKILLS",
[117] = "CHAT_MSG_WHISPER",
[118] = "CHAT_MSG_WHISPER_INFORM",
[119] = "CHAT_MSG_YELL",
[120] = "CINEMATIC_START",
[121] = "CINEMATIC_STOP",
[123] = "CLOSE_INBOX_ITEM",
[124] = "CLOSE_TABARD_FRAME",
[125] = "CLOSE_WORLD_MAP",
[126] = "COMBAT_LOG_EVENT",
[127] = "COMBAT_LOG_EVENT_UNFILTERED",
[128] = "COMBAT_RATING_UPDATE",
[129] = "COMBAT_TEXT_UPDATE",
[130] = "COMMENTATOR_ENTER_WORLD",
[131] = "COMMENTATOR_MAP_UPDATE",
[132] = "COMMENTATOR_PLAYER_UPDATE",
[133] = "COMPANION_LEARNED",
[134] = "COMPANION_UPDATE",
[135] = "CONFIRM_BINDER",
[136] = "CONFIRM_LOOT_ROLL",
[137] = "CONFIRM_SUMMON",
[138] = "CONFIRM_TALENT_WIPE",
[139] = "CONFIRM_XP_LOSS",
[140] = "CORPSE_IN_INSTANCE",
[141] = "CORPSE_IN_RANGE",
[142] = "CORPSE_OUT_OF_RANGE",
[143] = "CRITERIA_UPDATE",
[144] = "CURRENCY_DISPLAY_UPDATE",
[145] = "CURRENT_SPELL_CAST_CHANGED",
[146] = "CURSOR_UPDATE",
[147] = "CVAR_UPDATE",
[148] = "DELETE_ITEM_CONFIRM",
[149] = "DISABLE_TAXI_BENCHMARK",
[150] = "DISABLE_XP_GAIN",
[151] = "DISPLAY_SIZE_CHANGED",
[152] = "DUEL_FINISHED",
[153] = "DUEL_INBOUNDS",
[154] = "DUEL_OUTOFBOUNDS",
[155] = "DUEL_REQUESTED",
[156] = "EJECT_PASSENGER_UPDATE",
[157] = "ENABLE_TAXI_BENCHMARK",
[158] = "ENABLE_XP_GAIN",
[159] = "END_BOUND_TRADEABLE",
[160] = "END_REFUND",
[161] = "EQUIPMENT_SETS_CHANGED",
[162] = "EQUIPMENT_SWAP_FINISHED",
[163] = "EQUIPMENT_SWAP_PENDING",
[164] = "EQUIP_BIND_CONFIRM",
[165] = "EXECUTE_CHAT_LINE",
[166] = "FRIENDLIST_UPDATE",
[167] = "GLYPH_ADDED",
[168] = "GLYPH_DISABLED",
[169] = "GLYPH_ENABLED",
[170] = "GLYPH_REMOVED",
[171] = "GLYPH_UPDATED",
[172] = "GMRESPONSE_RECEIVED",
[173] = "GMSURVEY_DISPLAY",
[174] = "GM_PLAYER_INFO",
[175] = "GOSSIP_CLOSED",
[176] = "GOSSIP_CONFIRM",
[177] = "GOSSIP_CONFIRM_CANCEL",
[178] = "GOSSIP_ENTER_CODE",
[179] = "GOSSIP_SHOW",
[180] = "GUILDBANKBAGSLOTS_CHANGED",
[181] = "GUILDBANKFRAME_CLOSED",
[182] = "GUILDBANKFRAME_OPENED",
[183] = "GUILDBANKLOG_UPDATE",
[184] = "GUILDBANK_ITEM_LOCK_CHANGED",
[185] = "GUILDBANK_TEXT_CHANGED",
[186] = "GUILDBANK_UPDATE_MONEY",
[187] = "GUILDBANK_UPDATE_TABS",
[188] = "GUILDBANK_UPDATE_TEXT",
[189] = "GUILDBANK_UPDATE_WITHDRAWMONEY",
[190] = "GUILDTABARD_UPDATE",
[191] = "GUILD_EVENT_LOG_UPDATE",
[192] = "GUILD_INVITE_CANCEL",
[193] = "GUILD_INVITE_REQUEST",
[194] = "GUILD_MOTD",
[195] = "GUILD_REGISTRAR_CLOSED",
[196] = "GUILD_REGISTRAR_SHOW",
[197] = "GUILD_ROSTER_UPDATE",
[198] = "HONOR_CURRENCY_UPDATE",
[199] = "IGNORELIST_UPDATE",
[200] = "IGR_BILLING_NAG_DIALOG",
[201] = "INSPECT_ACHIEVEMENT_READY",
[202] = "INSPECT_HONOR_UPDATE",
[203] = "INSPECT_TALENT_READY",
[204] = "INSTANCE_BOOT_START",
[205] = "INSTANCE_BOOT_STOP",
[206] = "INSTANCE_LOCK_START",
[207] = "INSTANCE_LOCK_STOP",
[208] = "ITEM_LOCKED",
[209] = "ITEM_LOCK_CHANGED",
[210] = "ITEM_PUSH",
[211] = "ITEM_TEXT_BEGIN",
[212] = "ITEM_TEXT_CLOSED",
[213] = "ITEM_TEXT_READY",
[214] = "ITEM_TEXT_TRANSLATION",
[215] = "ITEM_UNLOCKED",
[216] = "KNOWLEDGE_BASE_ARTICLE_LOAD_FAILURE",
[217] = "KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS",
[218] = "KNOWLEDGE_BASE_QUERY_LOAD_FAILURE",
[219] = "KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS",
[220] = "KNOWLEDGE_BASE_SERVER_MESSAGE",
[221] = "KNOWLEDGE_BASE_SETUP_LOAD_FAILURE",
[222] = "KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS",
[223] = "KNOWLEDGE_BASE_SYSTEM_MOTD_UPDATED",
[224] = "KNOWN_CURRENCY_TYPES_UPDATE",
[225] = "KNOWN_TITLES_UPDATE",
[226] = "LANGUAGE_LIST_CHANGED",
[227] = "LEARNED_SPELL_IN_TAB",
[228] = "LEVEL_GRANT_PROPOSED",
[229] = "LFG_MATCH_CANCEL",
[230] = "LFG_MATCH_REQUEST",
[231] = "LFG_PENDING_CANCEL",
[232] = "LFG_PENDING_REQUEST",
[233] = "LFG_UPDATE",
[234] = "LOCALPLAYER_PET_RENAMED",
[235] = "LOGOUT_CANCEL",
[236] = "LOOT_BIND_CONFIRM",
[237] = "LOOT_CLOSED",
[238] = "LOOT_OPENED",
[239] = "LOOT_SLOT_CLEARED",
[240] = "MACRO_ACTION_BLOCKED",
[241] = "MACRO_ACTION_FORBIDDEN",
[242] = "MAIL_CLOSED",
[243] = "MAIL_FAILED",
[244] = "MAIL_INBOX_UPDATE",
[245] = "MAIL_SEND_INFO_UPDATE",
[246] = "MAIL_SEND_SUCCESS",
[247] = "MAIL_SHOW",
[248] = "MEETINGSTONE_CHANGED",
[249] = "MERCHANT_CLOSED",
[250] = "MERCHANT_SHOW",
[251] = "MERCHANT_UPDATE",
[252] = "MINIGAME_UPDATE",
[253] = "MINIMAP_PING",
[254] = "MINIMAP_UPDATE_TRACKING",
[255] = "MINIMAP_UPDATE_ZOOM",
[256] = "MIRROR_TIMER_PAUSE",
[257] = "MIRROR_TIMER_START",
[258] = "MIRROR_TIMER_STOP",
[259] = "MODIFIER_STATE_CHANGED",
[260] = "MOVIE_COMPRESSING_PROGRESS",
[261] = "MOVIE_RECORDING_PROGRESS",
[262] = "MOVIE_UNCOMPRESSED_MOVIE",
[263] = "MUTELIST_UPDATE",
[264] = "NEW_AUCTION_UPDATE",
[265] = "NEW_TITLE_EARNED",
[266] = "NPC_PVPQUEUE_ANYWHERE",
[267] = "OLD_TITLE_LOST",
[268] = "OPEN_MASTER_LOOT_LIST",
[269] = "OPEN_TABARD_FRAME",
[270] = "PARTY_CONVERTED_TO_RAID",
[271] = "PARTY_INVITE_CANCEL",
[272] = "PARTY_INVITE_REQUEST",
[273] = "PARTY_LEADER_CHANGED",
[274] = "PARTY_LOOT_METHOD_CHANGED",
[275] = "PARTY_MEMBERS_CHANGED",
[276] = "PARTY_MEMBER_DISABLE",
[277] = "PARTY_MEMBER_ENABLE",
[278] = "PETITION_CLOSED",
[279] = "PETITION_SHOW",
[280] = "PETITION_VENDOR_CLOSED",
[281] = "PETITION_VENDOR_SHOW",
[282] = "PETITION_VENDOR_UPDATE",
[283] = "PET_ATTACK_START",
[284] = "PET_ATTACK_STOP",
[285] = "PET_BAR_HIDE",
[286] = "PET_BAR_HIDEGRID",
[287] = "PET_BAR_SHOWGRID",
[288] = "PET_BAR_UPDATE",
[289] = "PET_BAR_UPDATE_COOLDOWN",
[290] = "PET_DISMISS_START",
[291] = "PET_FORCE_NAME_DECLENSION",
[292] = "PET_RENAMEABLE",
[293] = "PET_STABLE_CLOSED",
[294] = "PET_STABLE_SHOW",
[295] = "PET_STABLE_UPDATE",
[296] = "PET_STABLE_UPDATE_PAPERDOLL",
[297] = "PET_TALENT_UPDATE",
[298] = "PET_UI_CLOSE",
[299] = "PET_UI_UPDATE",
[300] = "PLAYERBANKBAGSLOTS_CHANGED",
[301] = "PLAYERBANKSLOTS_CHANGED",
[302] = "PLAYER_ALIVE",
[303] = "PLAYER_AURAS_CHANGED",
[304] = "PLAYER_CAMPING",
[305] = "PLAYER_CONTROL_GAINED",
[306] = "PLAYER_CONTROL_LOST",
[307] = "PLAYER_DAMAGE_DONE_MODS",
[308] = "PLAYER_DEAD",
[309] = "PLAYER_ENTERING_BATTLEGROUND",
[310] = "PLAYER_ENTERING_WORLD",
[311] = "PLAYER_ENTER_COMBAT",
[312] = "PLAYER_EQUIPMENT_CHANGED",
[313] = "PLAYER_FARSIGHT_FOCUS_CHANGED",
[314] = "PLAYER_FLAGS_CHANGED",
[315] = "PLAYER_FOCUS_CHANGED",
[316] = "PLAYER_GAINS_VEHICLE_DATA",
[317] = "PLAYER_GUILD_UPDATE",
[318] = "PLAYER_LEAVE_COMBAT",
[319] = "PLAYER_LEAVING_WORLD",
[320] = "PLAYER_LEVEL_UP",
[321] = "PLAYER_LOGIN",
[322] = "PLAYER_LOGOUT",
[323] = "PLAYER_LOSES_VEHICLE_DATA",
[324] = "PLAYER_MONEY",
[325] = "PLAYER_PVP_KILLS_CHANGED",
[326] = "PLAYER_PVP_RANK_CHANGED",
[327] = "PLAYER_QUITING",
[328] = "PLAYER_REGEN_DISABLED",
[329] = "PLAYER_REGEN_ENABLED",
[330] = "PLAYER_SKINNED",
[331] = "PLAYER_TALENT_UPDATE",
[332] = "PLAYER_TARGET_CHANGED",
[333] = "PLAYER_TOTEM_UPDATE",
[334] = "PLAYER_TRADE_MONEY",
[335] = "PLAYER_UNGHOST",
[336] = "PLAYER_UPDATE_RESTING",
[337] = "PLAYER_XP_UPDATE",
[338] = "PLAYTIME_CHANGED",
[339] = "PLAY_MOVIE",
[340] = "PREVIEW_PET_TALENT_POINTS_CHANGED",
[341] = "PREVIEW_TALENT_POINTS_CHANGED",
[342] = "PVPQUEUE_ANYWHERE_SHOW",
[343] = "PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE",
[344] = "QUEST_ACCEPTED",
[345] = "QUEST_ACCEPT_CONFIRM",
[346] = "QUEST_COMPLETE",
[347] = "QUEST_DETAIL",
[348] = "QUEST_FINISHED",
[349] = "QUEST_GREETING",
[350] = "QUEST_ITEM_UPDATE",
[351] = "QUEST_LOG_UPDATE",
[352] = "QUEST_PROGRESS",
[353] = "QUEST_WATCH_UPDATE",
[354] = "RAID_INSTANCE_WELCOME",
[355] = "RAID_ROSTER_UPDATE",
[356] = "RAID_TARGET_UPDATE",
[357] = "RAISED_AS_GHOUL",
[358] = "READY_CHECK",
[359] = "READY_CHECK_CONFIRM",
[360] = "READY_CHECK_FINISHED",
[361] = "REPLACE_ENCHANT",
[362] = "RESURRECT_REQUEST",
[363] = "RUNE_POWER_UPDATE",
[364] = "RUNE_REGEN_ENABLED",
[365] = "RUNE_TYPE_UPDATE",
[366] = "SCREENSHOT_FAILED",
[367] = "SCREENSHOT_SUCCEEDED",
[368] = "SEND_MAIL_COD_CHANGED",
[369] = "SEND_MAIL_MONEY_CHANGED",
[370] = "SHOW_COMPARE_TOOLTIP",
[371] = "SKILL_LINES_CHANGED",
[372] = "SOCKET_INFO_CLOSE",
[373] = "SOCKET_INFO_UPDATE",
[374] = "SOUND_DEVICE_UPDATE",
[375] = "SPELLS_CHANGED",
[376] = "SPELL_UPDATE_COOLDOWN",
[377] = "SPELL_UPDATE_USABLE",
[378] = "START_AUTOREPEAT_SPELL",
[379] = "START_LOOT_ROLL",
[380] = "START_MINIGAME",
[381] = "STOP_AUTOREPEAT_SPELL",
[382] = "SYNCHRONIZE_SETTINGS",
[383] = "TABARD_CANSAVE_CHANGED",
[384] = "TABARD_SAVE_PENDING",
[385] = "TAXIMAP_CLOSED",
[386] = "TAXIMAP_OPENED",
[387] = "TIME_PLAYED_MSG",
[388] = "TRACKED_ACHIEVEMENT_UPDATE",
[389] = "TRADE_ACCEPT_UPDATE",
[390] = "TRADE_CLOSED",
[391] = "TRADE_MONEY_CHANGED",
[392] = "TRADE_PLAYER_ITEM_CHANGED",
[393] = "TRADE_REPLACE_ENCHANT",
[394] = "TRADE_REQUEST",
[395] = "TRADE_REQUEST_CANCEL",
[396] = "TRADE_SHOW",
[397] = "TRADE_SKILL_CLOSE",
[398] = "TRADE_SKILL_FILTER_UPDATE",
[399] = "TRADE_SKILL_SHOW",
[400] = "TRADE_SKILL_UPDATE",
[401] = "TRADE_TARGET_ITEM_CHANGED",
[402] = "TRADE_UPDATE",
[403] = "TRAINER_CLOSED",
[404] = "TRAINER_DESCRIPTION_UPDATE",
[405] = "TRAINER_SHOW",
[406] = "TRAINER_UPDATE",
[407] = "TUTORIAL_TRIGGER",
[408] = "UI_ERROR_MESSAGE",
[409] = "UI_INFO_MESSAGE",
[410] = "UNIT_ATTACK",
[411] = "UNIT_ATTACK_POWER",
[412] = "UNIT_ATTACK_SPEED",
[413] = "UNIT_AURA",
[414] = "UNIT_CLASSIFICATION_CHANGED",
[415] = "UNIT_COMBAT",
[416] = "UNIT_COMBO_POINTS",
[417] = "UNIT_DAMAGE",
[418] = "UNIT_DEFENSE",
[419] = "UNIT_DISPLAYPOWER",
[420] = "UNIT_DYNAMIC_FLAGS",
[421] = "UNIT_ENERGY",
[422] = "UNIT_ENTERED_VEHICLE",
[423] = "UNIT_ENTERING_VEHICLE",
[424] = "UNIT_EXITED_VEHICLE",
[425] = "UNIT_EXITING_VEHICLE",
[426] = "UNIT_FACTION",
[427] = "UNIT_FLAGS",
[428] = "UNIT_FOCUS",
[429] = "UNIT_HAPPINESS",
[430] = "UNIT_HEALTH",
[431] = "UNIT_INVENTORY_CHANGED",
[432] = "UNIT_LEVEL",
[433] = "UNIT_MANA",
[434] = "UNIT_MAXENERGY",
[435] = "UNIT_MAXFOCUS",
[436] = "UNIT_MAXHAPPINESS",
[437] = "UNIT_MAXHEALTH",
[438] = "UNIT_MAXMANA",
[439] = "UNIT_MAXRAGE",
[440] = "UNIT_MAXRUNIC_POWER",
[441] = "UNIT_MODEL_CHANGED",
[442] = "UNIT_NAME_UPDATE",
[443] = "UNIT_PET",
[444] = "UNIT_PET_EXPERIENCE",
[445] = "UNIT_PORTRAIT_UPDATE",
[446] = "UNIT_QUEST_LOG_CHANGED",
[447] = "UNIT_RAGE",
[448] = "UNIT_RANGEDDAMAGE",
[449] = "UNIT_RANGED_ATTACK_POWER",
[450] = "UNIT_RESISTANCES",
[451] = "UNIT_RUNIC_POWER",
[452] = "UNIT_SPELLCAST_CHANNEL_START",
[453] = "UNIT_SPELLCAST_CHANNEL_STOP",
[454] = "UNIT_SPELLCAST_CHANNEL_UPDATE",
[455] = "UNIT_SPELLCAST_DELAYED",
[456] = "UNIT_SPELLCAST_FAILED",
[457] = "UNIT_SPELLCAST_FAILED_QUIET",
[458] = "UNIT_SPELLCAST_INTERRUPTED",
[459] = "UNIT_SPELLCAST_INTERRUPTIBLE",
[460] = "UNIT_SPELLCAST_NOT_INTERRUPTIBLE",
[461] = "UNIT_SPELLCAST_SENT",
[462] = "UNIT_SPELLCAST_START",
[463] = "UNIT_SPELLCAST_STOP",
[464] = "UNIT_SPELLCAST_SUCCEEDED",
[465] = "UNIT_STATS",
[466] = "UNIT_TARGET",
[467] = "UNIT_THREAT_LIST_UPDATE",
[468] = "UNIT_THREAT_SITUATION_UPDATE",
[469] = "UPDATE_BATTLEFIELD_SCORE",
[470] = "UPDATE_BATTLEFIELD_STATUS",
[471] = "UPDATE_BINDINGS",
[472] = "UPDATE_BONUS_ACTIONBAR",
[473] = "UPDATE_CHAT_COLOR",
[474] = "UPDATE_CHAT_COLOR_NAME_BY_CLASS",
[475] = "UPDATE_CHAT_WINDOWS",
[476] = "UPDATE_EXHAUSTION",
[477] = "UPDATE_FACTION",
[478] = "UPDATE_FLOATING_CHAT_WINDOWS",
[479] = "UPDATE_GM_STATUS",
[480] = "UPDATE_INSTANCE_INFO",
[481] = "UPDATE_INVENTORY_ALERTS",
[482] = "UPDATE_INVENTORY_DURABILITY",
[483] = "UPDATE_LFG",
[484] = "UPDATE_LFG_LIST",
[485] = "UPDATE_LFG_LIST_INCREMENTAL",
[486] = "UPDATE_LFG_TYPES",
[487] = "UPDATE_MACROS",
[488] = "UPDATE_MASTER_LOOT_LIST",
[489] = "UPDATE_MOUSEOVER_UNIT",
[490] = "UPDATE_MULTI_CAST_ACTIONBAR",
[491] = "UPDATE_PENDING_MAIL",
[492] = "UPDATE_SHAPESHIFT_COOLDOWN",
[493] = "UPDATE_SHAPESHIFT_FORM",
[494] = "UPDATE_SHAPESHIFT_FORMS",
[495] = "UPDATE_SHAPESHIFT_USABLE",
[496] = "UPDATE_STEALTH",
[497] = "UPDATE_TICKET",
[498] = "UPDATE_TRADESKILL_RECAST",
[499] = "UPDATE_WORLD_STATES",
[500] = "USE_BIND_CONFIRM",
[501] = "USE_GLYPH",
[502] = "VARIABLES_LOADED",
[503] = "VEHICLE_ANGLE_SHOW",
[504] = "VEHICLE_ANGLE_UPDATE",
[505] = "VEHICLE_PASSENGERS_CHANGED",
[506] = "VEHICLE_POWER_SHOW",
[507] = "VEHICLE_UPDATE",
[508] = "VOICE_CHANNEL_STATUS_UPDATE",
[509] = "VOICE_CHAT_ENABLED_UPDATE",
[510] = "VOICE_LEFT_SESSION",
[512] = "VOICE_PLATE_START",
[513] = "VOICE_PLATE_STOP",
[514] = "VOICE_PUSH_TO_TALK_START",
[515] = "VOICE_PUSH_TO_TALK_STOP",
[516] = "VOICE_SELF_MUTE",
[517] = "VOICE_SESSIONS_UPDATE",
[518] = "VOICE_START",
[519] = "VOICE_STATUS_UPDATE",
[520] = "VOICE_STOP",
[521] = "VOICE_TALKER_START_PARTY",
[522] = "VOICE_TALKER_START_RAID",
[523] = "VOICE_TALKER_STOP_PARTY",
[524] = "VOICE_TALKER_STOP_RAID",
[525] = "WEAR_EQUIPMENT_SET",
[526] = "WHO_LIST_UPDATE",
[527] = "WORLD_MAP_NAME_UPDATE",
[528] = "WORLD_MAP_UPDATE",
[529] = "WORLD_STATE_UI_TIMER_UPDATE",
[530] = "ZONE_CHANGED",
[531] = "ZONE_CHANGED_INDOORS",
[532] = "ZONE_CHANGED_NEW_AREA"};

local data = {};
local m_FrameCount = 1;
local tDiff = 0;

function update(self, elapsed)
--    calcFPS(elapsed);
end

function calcFPS(elapsed)
    tDiff = tDiff + elapsed;
    if tDiff > 1.0 then
        local _currentFPS = m_FrameCount / tDiff;
	print("FPS: " .. _currentFPS);
        tDiff = 0;
        m_FrameCount = 0;
    end
    
    m_FrameCount = m_FrameCount + 1;
end

function events:ACHIEVEMENT_EARNED(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_HIDEGRID(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_PAGE_CHANGED(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_SHOWGRID(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_SLOT_CHANGED(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_UPDATE_COOLDOWN(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_UPDATE_STATE(...)
    debug("Event: ", ...);
end
function events:ACTIONBAR_UPDATE_USABLE(...)
    debug("Event: ", ...);
end
function events:ACTIVE_TALENT_GROUP_CHANGED(...)
    debug("Event: ", ...);
end
function events:ADDON_ACTION_BLOCKED(...)
    debug("Event: ", ...);
end
function events:ADDON_ACTION_FORBIDDEN(...)
    debug("Event: ", ...);
end
function events:ADDON_LOADED(...)
    debug("Event: ", ...);
end
function events:AREA_SPIRIT_HEALER_IN_RANGE(...)
    debug("Event: ", ...);
end
function events:AREA_SPIRIT_HEALER_OUT_OF_RANGE(...)
    debug("Event: ", ...);
end
function events:ARENA_OPPONENT_UPDATE(...)
    debug("Event: ", ...);
end
function events:ARENA_SEASON_WORLD_STATE(...)
    debug("Event: ", ...);
end
function events:ARENA_TEAM_INVITE_REQUEST(...)
    debug("Event: ", ...);
end
function events:ARENA_TEAM_ROSTER_UPDATE(...)
    debug("Event: ", ...);
end
function events:ARENA_TEAM_UPDATE(...)
    debug("Event: ", ...);
end
function events:AUCTION_BIDDER_LIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:AUCTION_HOUSE_CLOSED(...)
    debug("Event: ", ...);
end
function events:AUCTION_HOUSE_SHOW(...)
    debug("Event: ", ...);
end
function events:AUCTION_ITEM_LIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:AUCTION_OWNED_LIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:AUTOEQUIP_BIND_CONFIRM(...)
    debug("Event: ", ...);
end
function events:AUTOFOLLOW_BEGIN(...)
    debug("Event: ", ...);
end
function events:AUTOFOLLOW_END(...)
    debug("Event: ", ...);
end
function events:BAG_CLOSED(...)
    debug("Event: ", ...);
end
function events:BAG_OPEN(...)
    debug("Event: ", ...);
end
function events:BAG_UPDATE(...)
    debug("Event: ", ...);
end
function events:BAG_UPDATE_COOLDOWN(...)
    debug("Event: ", ...);
end
function events:BANKFRAME_CLOSED(...)
    debug("Event: ", ...);
end
function events:BANKFRAME_OPENED(...)
    debug("Event: ", ...);
end
function events:BARBER_SHOP_APPEARANCE_APPLIED(...)
    debug("Event: ", ...);
end
function events:BARBER_SHOP_CLOSE(...)
    debug("Event: ", ...);
end
function events:BARBER_SHOP_OPEN(...)
    debug("Event: ", ...);
end
function events:BARBER_SHOP_SUCCESS(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELDS_CLOSED(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELDS_SHOW(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_EJECTED(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_EJECT_PENDING(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_ENTERED(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_ENTRY_INVITE(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_QUEUE_INVITE(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE(...)
    debug("Event: ", ...);
end
function events:BATTLEFIELD_MGR_STATE_CHANGE(...)
    debug("Event: ", ...);
end
function events:BILLING_NAG_DIALOG(...)
    debug("Event: ", ...);
end
function events:BIND_ENCHANT(...)
    debug("Event: ", ...);
end
function events:CALENDAR_ACTION_PENDING(...)
    debug("Event: ", ...);
end
function events:CALENDAR_CLOSE_EVENT(...)
    debug("Event: ", ...);
end
function events:CALENDAR_EVENT_ALARM(...)
    debug("Event: ", ...);
end
function events:CALENDAR_GUILD_RANKS(...)
    debug("Event: ", ...);
end
function events:CALENDAR_NEW_EVENT(...)
    debug("Event: ", ...);
end
function events:CALENDAR_OPEN_EVENT(...)
    debug("Event: ", ...);
end
function events:CALENDAR_UPDATE_ERROR(...)
    debug("Event: ", ...);
end
function events:CALENDAR_UPDATE_EVENT(...)
    debug("Event: ", ...);
end
function events:CALENDAR_UPDATE_EVENT_LIST(...)
    debug("Event: ", ...);
end
function events:CALENDAR_UPDATE_INVITE_LIST(...)
    debug("Event: ", ...);
end
function events:CALENDAR_UPDATE_PENDING_INVITES(...)
    debug("Event: ", ...);
end
function events:CANCEL_LOOT_ROLL(...)
    debug("Event: ", ...);
end
function events:CANCEL_SUMMON(...)
    debug("Event: ", ...);
end
function events:CHANNEL_COUNT_UPDATE(...)
    debug("Event: ", ...);
end
function events:CHANNEL_FLAGS_UPDATED(...)
    debug("Event: ", ...);
end
function events:CHANNEL_INVITE_REQUEST(...)
    debug("Event: ", ...);
end
function events:CHANNEL_PASSWORD_REQUEST(...)
    debug("Event: ", ...);
end
function events:CHANNEL_ROSTER_UPDATE(...)
    debug("Event: ", ...);
end
function events:CHANNEL_UI_UPDATE(...)
    debug("Event: ", ...);
end
function events:CHANNEL_VOICE_UPDATE(...)
    debug("Event: ", ...);
end
function events:CHARACTER_POINTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_ACHIEVEMENT(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_ADDON(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_AFK(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BATTLEGROUND(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BATTLEGROUND_LEADER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BG_SYSTEM_ALLIANCE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BG_SYSTEM_HORDE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BG_SYSTEM_NEUTRAL(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_BN(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL_JOIN(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL_LEAVE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL_LIST(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL_NOTICE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_CHANNEL_NOTICE_USER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_COMBAT_FACTION_CHANGE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_COMBAT_HONOR_GAIN(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_COMBAT_MISC_INFO(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_COMBAT_XP_GAIN(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_DND(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_EMOTE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_FILTERED(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_GUILD(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_GUILD_ACHIEVEMENT(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_IGNORED(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_LOOT(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONEY(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONSTER_EMOTE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONSTER_PARTY(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONSTER_SAY(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONSTER_WHISPER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_MONSTER_YELL(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_OFFICER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_OPENING(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_PARTY(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_PET_INFO(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RAID(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RAID_BOSS_EMOTE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RAID_BOSS_WHISPER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RAID_LEADER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RAID_WARNING(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_RESTRICTED(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_SAY(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_SKILL(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_SYSTEM(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_TEXT_EMOTE(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_TRADESKILLS(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_WHISPER(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_WHISPER_INFORM(...)
    debug("Event: ", ...);
end
function events:CHAT_MSG_YELL(...)
    debug("Event: ", ...);
end
function events:CINEMATIC_START(...)
    debug("Event: ", ...);
end
function events:CINEMATIC_STOP(...)
    debug("Event: ", ...);
end
function events:CLOSE_INBOX_ITEM(...)
    debug("Event: ", ...);
end
function events:CLOSE_TABARD_FRAME(...)
    debug("Event: ", ...);
end
function events:CLOSE_WORLD_MAP(...)
    debug("Event: ", ...);
end
function events:COMBAT_LOG_EVENT(...)
    debug("Event: ", ...);
end
function events:COMBAT_LOG_EVENT_UNFILTERED(...)
    debug("Event: ", ...);
end
function events:COMBAT_RATING_UPDATE(...)
    debug("Event: ", ...);
end
function events:COMBAT_TEXT_UPDATE(...)
    debug("Event: ", ...);
end
function events:COMMENTATOR_ENTER_WORLD(...)
    debug("Event: ", ...);
end
function events:COMMENTATOR_MAP_UPDATE(...)
    debug("Event: ", ...);
end
function events:COMMENTATOR_PLAYER_UPDATE(...)
    debug("Event: ", ...);
end
function events:COMPANION_LEARNED(...)
    debug("Event: ", ...);
end
function events:COMPANION_UPDATE(...)
    debug("Event: ", ...);
end
function events:CONFIRM_BINDER(...)
    debug("Event: ", ...);
end
function events:CONFIRM_LOOT_ROLL(...)
    debug("Event: ", ...);
end
function events:CONFIRM_SUMMON(...)
    debug("Event: ", ...);
end
function events:CONFIRM_TALENT_WIPE(...)
    debug("Event: ", ...);
end
function events:CONFIRM_XP_LOSS(...)
    debug("Event: ", ...);
end
function events:CORPSE_IN_INSTANCE(...)
    debug("Event: ", ...);
end
function events:CORPSE_IN_RANGE(...)
    debug("Event: ", ...);
end
function events:CORPSE_OUT_OF_RANGE(...)
    debug("Event: ", ...);
end
function events:CRITERIA_UPDATE(...)
    debug("Event: ", ...);
end
function events:CURRENCY_DISPLAY_UPDATE(...)
    debug("Event: ", ...);
end
function events:CURRENT_SPELL_CAST_CHANGED(...)
    debug("Event: ", ...);
end
function events:CURSOR_UPDATE(...)
    debug("Event: ", ...);
end
function events:CVAR_UPDATE(...)
    debug("Event: ", ...);
end
function events:DELETE_ITEM_CONFIRM(...)
    debug("Event: ", ...);
end
function events:DISABLE_TAXI_BENCHMARK(...)
    debug("Event: ", ...);
end
function events:DISABLE_XP_GAIN(...)
    debug("Event: ", ...);
end
function events:DISPLAY_SIZE_CHANGED(...)
    debug("Event: ", ...);
end
function events:DUEL_FINISHED(...)
    debug("Event: ", ...);
end
function events:DUEL_INBOUNDS(...)
    debug("Event: ", ...);
end
function events:DUEL_OUTOFBOUNDS(...)
    debug("Event: ", ...);
end
function events:DUEL_REQUESTED(...)
    debug("Event: ", ...);
end
function events:EJECT_PASSENGER_UPDATE(...)
    debug("Event: ", ...);
end
function events:ENABLE_TAXI_BENCHMARK(...)
    debug("Event: ", ...);
end
function events:ENABLE_XP_GAIN(...)
    debug("Event: ", ...);
end
function events:END_BOUND_TRADEABLE(...)
    debug("Event: ", ...);
end
function events:END_REFUND(...)
    debug("Event: ", ...);
end
function events:EQUIPMENT_SETS_CHANGED(...)
    debug("Event: ", ...);
end
function events:EQUIPMENT_SWAP_FINISHED(...)
    debug("Event: ", ...);
end
function events:EQUIPMENT_SWAP_PENDING(...)
    debug("Event: ", ...);
end
function events:EQUIP_BIND_CONFIRM(...)
    debug("Event: ", ...);
end
function events:EXECUTE_CHAT_LINE(...)
    debug("Event: ", ...);
end
function events:FRIENDLIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:GLYPH_ADDED(...)
    debug("Event: ", ...);
end
function events:GLYPH_DISABLED(...)
    debug("Event: ", ...);
end
function events:GLYPH_ENABLED(...)
    debug("Event: ", ...);
end
function events:GLYPH_REMOVED(...)
    debug("Event: ", ...);
end
function events:GLYPH_UPDATED(...)
    debug("Event: ", ...);
end
function events:GMRESPONSE_RECEIVED(...)
    debug("Event: ", ...);
end
function events:GMSURVEY_DISPLAY(...)
    debug("Event: ", ...);
end
function events:GM_PLAYER_INFO(...)
    debug("Event: ", ...);
end
function events:GOSSIP_CLOSED(...)
    debug("Event: ", ...);
end
function events:GOSSIP_CONFIRM(...)
    debug("Event: ", ...);
end
function events:GOSSIP_CONFIRM_CANCEL(...)
    debug("Event: ", ...);
end
function events:GOSSIP_ENTER_CODE(...)
    debug("Event: ", ...);
end
function events:GOSSIP_SHOW(...)
    debug("Event: ", ...);
end
function events:GUILDBANKBAGSLOTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:GUILDBANKFRAME_CLOSED(...)
    debug("Event: ", ...);
end
function events:GUILDBANKFRAME_OPENED(...)
    debug("Event: ", ...);
end
function events:GUILDBANKLOG_UPDATE(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_ITEM_LOCK_CHANGED(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_TEXT_CHANGED(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_UPDATE_MONEY(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_UPDATE_TABS(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_UPDATE_TEXT(...)
    debug("Event: ", ...);
end
function events:GUILDBANK_UPDATE_WITHDRAWMONEY(...)
    debug("Event: ", ...);
end
function events:GUILDTABARD_UPDATE(...)
    debug("Event: ", ...);
end
function events:GUILD_EVENT_LOG_UPDATE(...)
    debug("Event: ", ...);
end
function events:GUILD_INVITE_CANCEL(...)
    debug("Event: ", ...);
end
function events:GUILD_INVITE_REQUEST(...)
    debug("Event: ", ...);
end
function events:GUILD_MOTD(...)
    debug("Event: ", ...);
end
function events:GUILD_REGISTRAR_CLOSED(...)
    debug("Event: ", ...);
end
function events:GUILD_REGISTRAR_SHOW(...)
    debug("Event: ", ...);
end
function events:GUILD_ROSTER_UPDATE(...)
    debug("Event: ", ...);
end
function events:HONOR_CURRENCY_UPDATE(...)
    debug("Event: ", ...);
end
function events:IGNORELIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:IGR_BILLING_NAG_DIALOG(...)
    debug("Event: ", ...);
end
function events:INSPECT_ACHIEVEMENT_READY(...)
    debug("Event: ", ...);
end
function events:INSPECT_HONOR_UPDATE(...)
    debug("Event: ", ...);
end
function events:INSPECT_TALENT_READY(...)
    debug("Event: ", ...);
end
function events:INSTANCE_BOOT_START(...)
    debug("Event: ", ...);
end
function events:INSTANCE_BOOT_STOP(...)
    debug("Event: ", ...);
end
function events:INSTANCE_LOCK_START(...)
    debug("Event: ", ...);
end
function events:INSTANCE_LOCK_STOP(...)
    debug("Event: ", ...);
end
function events:ITEM_LOCKED(...)
    debug("Event: ", ...);
end
function events:ITEM_LOCK_CHANGED(...)
    debug("Event: ", ...);
end
function events:ITEM_PUSH(...)
    debug("Event: ", ...);
end
function events:ITEM_TEXT_BEGIN(...)
    debug("Event: ", ...);
end
function events:ITEM_TEXT_CLOSED(...)
    debug("Event: ", ...);
end
function events:ITEM_TEXT_READY(...)
    debug("Event: ", ...);
end
function events:ITEM_TEXT_TRANSLATION(...)
    debug("Event: ", ...);
end
function events:ITEM_UNLOCKED(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_ARTICLE_LOAD_FAILURE(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_QUERY_LOAD_FAILURE(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_SERVER_MESSAGE(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_SETUP_LOAD_FAILURE(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS(...)
    debug("Event: ", ...);
end
function events:KNOWLEDGE_BASE_SYSTEM_MOTD_UPDATED(...)
    debug("Event: ", ...);
end
function events:KNOWN_CURRENCY_TYPES_UPDATE(...)
    debug("Event: ", ...);
end
function events:KNOWN_TITLES_UPDATE(...)
    debug("Event: ", ...);
end
function events:LANGUAGE_LIST_CHANGED(...)
    debug("Event: ", ...);
end
function events:LEARNED_SPELL_IN_TAB(...)
    debug("Event: ", ...);
end
function events:LEVEL_GRANT_PROPOSED(...)
    debug("Event: ", ...);
end
function events:LFG_MATCH_CANCEL(...)
    debug("Event: ", ...);
end
function events:LFG_MATCH_REQUEST(...)
    debug("Event: ", ...);
end
function events:LFG_PENDING_CANCEL(...)
    debug("Event: ", ...);
end
function events:LFG_PENDING_REQUEST(...)
    debug("Event: ", ...);
end
function events:LFG_UPDATE(...)
    debug("Event: ", ...);
end
function events:LOCALPLAYER_PET_RENAMED(...)
    debug("Event: ", ...);
end
function events:LOGOUT_CANCEL(...)
    debug("Event: ", ...);
end
function events:LOOT_BIND_CONFIRM(...)
    debug("Event: ", ...);
end
function events:LOOT_CLOSED(...)
    debug("Event: ", ...);
end
function events:LOOT_OPENED(...)
    debug("Event: ", ...);
end
function events:LOOT_SLOT_CLEARED(...)
    debug("Event: ", ...);
end
function events:MACRO_ACTION_BLOCKED(...)
    debug("Event: ", ...);
end
function events:MACRO_ACTION_FORBIDDEN(...)
    debug("Event: ", ...);
end
function events:MAIL_CLOSED(...)
    debug("Event: ", ...);
end
function events:MAIL_FAILED(...)
    debug("Event: ", ...);
end
function events:MAIL_INBOX_UPDATE(...)
    debug("Event: ", ...);
end
function events:MAIL_SEND_INFO_UPDATE(...)
    debug("Event: ", ...);
end
function events:MAIL_SEND_SUCCESS(...)
    debug("Event: ", ...);
end
function events:MAIL_SHOW(...)
    debug("Event: ", ...);
end
function events:MEETINGSTONE_CHANGED(...)
    debug("Event: ", ...);
end
function events:MERCHANT_CLOSED(...)
    debug("Event: ", ...);
end
function events:MERCHANT_SHOW(...)
    debug("Event: ", ...);
end
function events:MERCHANT_UPDATE(...)
    debug("Event: ", ...);
end
function events:MINIGAME_UPDATE(...)
    debug("Event: ", ...);
end
function events:MINIMAP_PING(...)
    debug("Event: ", ...);
end
function events:MINIMAP_UPDATE_TRACKING(...)
    debug("Event: ", ...);
end
function events:MINIMAP_UPDATE_ZOOM(...)
    debug("Event: ", ...);
end
function events:MIRROR_TIMER_PAUSE(...)
    debug("Event: ", ...);
end
function events:MIRROR_TIMER_START(...)
    debug("Event: ", ...);
end
function events:MIRROR_TIMER_STOP(...)
    debug("Event: ", ...);
end
function events:MODIFIER_STATE_CHANGED(...)
    debug("Event: ", ...);
end
function events:MOVIE_COMPRESSING_PROGRESS(...)
    debug("Event: ", ...);
end
function events:MOVIE_RECORDING_PROGRESS(...)
    debug("Event: ", ...);
end
function events:MOVIE_UNCOMPRESSED_MOVIE(...)
    debug("Event: ", ...);
end
function events:MUTELIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:NEW_AUCTION_UPDATE(...)
    debug("Event: ", ...);
end
function events:NEW_TITLE_EARNED(...)
    debug("Event: ", ...);
end
function events:NPC_PVPQUEUE_ANYWHERE(...)
    debug("Event: ", ...);
end
function events:OLD_TITLE_LOST(...)
    debug("Event: ", ...);
end
function events:OPEN_MASTER_LOOT_LIST(...)
    debug("Event: ", ...);
end
function events:OPEN_TABARD_FRAME(...)
    debug("Event: ", ...);
end
function events:PARTY_CONVERTED_TO_RAID(...)
    debug("Event: ", ...);
end
function events:PARTY_INVITE_CANCEL(...)
    debug("Event: ", ...);
end
function events:PARTY_INVITE_REQUEST(...)
    debug("Event: ", ...);
end
function events:PARTY_LEADER_CHANGED(...)
    debug("Event: ", ...);
end
function events:PARTY_LOOT_METHOD_CHANGED(...)
    debug("Event: ", ...);
end
function events:PARTY_MEMBERS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PARTY_MEMBER_DISABLE(...)
    debug("Event: ", ...);
end
function events:PARTY_MEMBER_ENABLE(...)
    debug("Event: ", ...);
end
function events:PETITION_CLOSED(...)
    debug("Event: ", ...);
end
function events:PETITION_SHOW(...)
    debug("Event: ", ...);
end
function events:PETITION_VENDOR_CLOSED(...)
    debug("Event: ", ...);
end
function events:PETITION_VENDOR_SHOW(...)
    debug("Event: ", ...);
end
function events:PETITION_VENDOR_UPDATE(...)
    debug("Event: ", ...);
end
function events:PET_ATTACK_START(...)
    debug("Event: ", ...);
end
function events:PET_ATTACK_STOP(...)
    debug("Event: ", ...);
end
function events:PET_BAR_HIDE(...)
    debug("Event: ", ...);
end
function events:PET_BAR_HIDEGRID(...)
    debug("Event: ", ...);
end
function events:PET_BAR_SHOWGRID(...)
    debug("Event: ", ...);
end
function events:PET_BAR_UPDATE(...)
    debug("Event: ", ...);
end
function events:PET_BAR_UPDATE_COOLDOWN(...)
    debug("Event: ", ...);
end
function events:PET_DISMISS_START(...)
    debug("Event: ", ...);
end
function events:PET_FORCE_NAME_DECLENSION(...)
    debug("Event: ", ...);
end
function events:PET_RENAMEABLE(...)
    debug("Event: ", ...);
end
function events:PET_STABLE_CLOSED(...)
    debug("Event: ", ...);
end
function events:PET_STABLE_SHOW(...)
    debug("Event: ", ...);
end
function events:PET_STABLE_UPDATE(...)
    debug("Event: ", ...);
end
function events:PET_STABLE_UPDATE_PAPERDOLL(...)
    debug("Event: ", ...);
end
function events:PET_TALENT_UPDATE(...)
    debug("Event: ", ...);
end
function events:PET_UI_CLOSE(...)
    debug("Event: ", ...);
end
function events:PET_UI_UPDATE(...)
    debug("Event: ", ...);
end
function events:PLAYERBANKBAGSLOTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYERBANKSLOTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_ALIVE(...)
    debug("Event: ", ...);
end
function events:PLAYER_AURAS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_CAMPING(...)
    debug("Event: ", ...);
end
function events:PLAYER_CONTROL_GAINED(...)
    debug("Event: ", ...);
end
function events:PLAYER_CONTROL_LOST(...)
    debug("Event: ", ...);
end
function events:PLAYER_DAMAGE_DONE_MODS(...)
    debug("Event: ", ...);
end
function events:PLAYER_DEAD(...)
    debug("Event: ", ...);
end
function events:PLAYER_ENTERING_BATTLEGROUND(...)
    debug("Event: ", ...);
end
function events:PLAYER_ENTERING_WORLD(...)
    debug("Event: ", ...);
end
function events:PLAYER_ENTER_COMBAT(...)
    debug("Event: ", ...);
end
function events:PLAYER_EQUIPMENT_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_FARSIGHT_FOCUS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_FLAGS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_FOCUS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_GAINS_VEHICLE_DATA(...)
    debug("Event: ", ...);
end
function events:PLAYER_GUILD_UPDATE(...)
    debug("Event: ", ...);
end
function events:PLAYER_LEAVE_COMBAT(...)
    debug("Event: ", ...);
end
function events:PLAYER_LEAVING_WORLD(...)
    debug("Event: ", ...);
end
function events:PLAYER_LEVEL_UP(...)
    debug("Event: ", ...);
end
function events:PLAYER_LOGIN(...)
    debug("Event: ", ...);
end
function events:PLAYER_LOGOUT(...)
    debug("Event: ", ...);
end
function events:PLAYER_LOSES_VEHICLE_DATA(...)
    debug("Event: ", ...);
end
function events:PLAYER_MONEY(...)
    debug("Event: ", ...);
end
function events:PLAYER_PVP_KILLS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_PVP_RANK_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_QUITING(...)
    debug("Event: ", ...);
end
function events:PLAYER_REGEN_DISABLED(...)
    debug("Event: ", ...);
end
function events:PLAYER_REGEN_ENABLED(...)
    debug("Event: ", ...);
end
function events:PLAYER_SKINNED(...)
    debug("Event: ", ...);
end
function events:PLAYER_TALENT_UPDATE(...)
    debug("Event: ", ...);
end
function events:PLAYER_TARGET_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAYER_TOTEM_UPDATE(...)
    debug("Event: ", ...);
end
function events:PLAYER_TRADE_MONEY(...)
    debug("Event: ", ...);
end
function events:PLAYER_UNGHOST(...)
    debug("Event: ", ...);
end
function events:PLAYER_UPDATE_RESTING(...)
    debug("Event: ", ...);
end
function events:PLAYER_XP_UPDATE(...)
    debug("Event: ", ...);
end
function events:PLAYTIME_CHANGED(...)
    debug("Event: ", ...);
end
function events:PLAY_MOVIE(...)
    debug("Event: ", ...);
end
function events:PREVIEW_PET_TALENT_POINTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PREVIEW_TALENT_POINTS_CHANGED(...)
    debug("Event: ", ...);
end
function events:PVPQUEUE_ANYWHERE_SHOW(...)
    debug("Event: ", ...);
end
function events:PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE(...)
    debug("Event: ", ...);
end
function events:QUEST_ACCEPTED(...)
    debug("Event: ", ...);
end
function events:QUEST_ACCEPT_CONFIRM(...)
    debug("Event: ", ...);
end
function events:QUEST_COMPLETE(...)
    debug("Event: ", ...);
end
function events:QUEST_DETAIL(...)
    debug("Event: ", ...);
end
function events:QUEST_FINISHED(...)
    debug("Event: ", ...);
end
function events:QUEST_GREETING(...)
    debug("Event: ", ...);
end
function events:QUEST_ITEM_UPDATE(...)
    debug("Event: ", ...);
end
function events:QUEST_LOG_UPDATE(...)
    debug("Event: ", ...);
end
function events:QUEST_PROGRESS(...)
    debug("Event: ", ...);
end
function events:QUEST_WATCH_UPDATE(...)
    debug("Event: ", ...);
end
function events:RAID_INSTANCE_WELCOME(...)
    debug("Event: ", ...);
end
function events:RAID_ROSTER_UPDATE(...)
    debug("Event: ", ...);
end
function events:RAID_TARGET_UPDATE(...)
    debug("Event: ", ...);
end
function events:RAISED_AS_GHOUL(...)
    debug("Event: ", ...);
end
function events:READY_CHECK(...)
    debug("Event: ", ...);
end
function events:READY_CHECK_CONFIRM(...)
    debug("Event: ", ...);
end
function events:READY_CHECK_FINISHED(...)
    debug("Event: ", ...);
end
function events:REPLACE_ENCHANT(...)
    debug("Event: ", ...);
end
function events:RESURRECT_REQUEST(...)
    debug("Event: ", ...);
end
function events:RUNE_POWER_UPDATE(...)
    debug("Event: ", ...);
end
function events:RUNE_REGEN_ENABLED(...)
    debug("Event: ", ...);
end
function events:RUNE_TYPE_UPDATE(...)
    debug("Event: ", ...);
end
function events:SCREENSHOT_FAILED(...)
    debug("Event: ", ...);
end
function events:SCREENSHOT_SUCCEEDED(...)
    debug("Event: ", ...);
end
function events:SEND_MAIL_COD_CHANGED(...)
    debug("Event: ", ...);
end
function events:SEND_MAIL_MONEY_CHANGED(...)
    debug("Event: ", ...);
end
function events:SHOW_COMPARE_TOOLTIP(...)
    debug("Event: ", ...);
end
function events:SKILL_LINES_CHANGED(...)
    debug("Event: ", ...);
end
function events:SOCKET_INFO_CLOSE(...)
    debug("Event: ", ...);
end
function events:SOCKET_INFO_UPDATE(...)
    debug("Event: ", ...);
end
function events:SOUND_DEVICE_UPDATE(...)
    debug("Event: ", ...);
end
function events:SPELLS_CHANGED(...)
    debug("Event: ", ...);
end
function events:SPELL_UPDATE_COOLDOWN(...)
    debug("Event: ", ...);
end
function events:SPELL_UPDATE_USABLE(...)
    debug("Event: ", ...);
end
function events:START_AUTOREPEAT_SPELL(...)
    debug("Event: ", ...);
end
function events:START_LOOT_ROLL(...)
    debug("Event: ", ...);
end
function events:START_MINIGAME(...)
    debug("Event: ", ...);
end
function events:STOP_AUTOREPEAT_SPELL(...)
    debug("Event: ", ...);
end
function events:SYNCHRONIZE_SETTINGS(...)
    debug("Event: ", ...);
end
function events:TABARD_CANSAVE_CHANGED(...)
    debug("Event: ", ...);
end
function events:TABARD_SAVE_PENDING(...)
    debug("Event: ", ...);
end
function events:TAXIMAP_CLOSED(...)
    debug("Event: ", ...);
end
function events:TAXIMAP_OPENED(...)
    debug("Event: ", ...);
end
function events:TIME_PLAYED_MSG(...)
    debug("Event: ", ...);
end
function events:TRACKED_ACHIEVEMENT_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRADE_ACCEPT_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRADE_CLOSED(...)
    debug("Event: ", ...);
end
function events:TRADE_MONEY_CHANGED(...)
    debug("Event: ", ...);
end
function events:TRADE_PLAYER_ITEM_CHANGED(...)
    debug("Event: ", ...);
end
function events:TRADE_REPLACE_ENCHANT(...)
    debug("Event: ", ...);
end
function events:TRADE_REQUEST(...)
    debug("Event: ", ...);
end
function events:TRADE_REQUEST_CANCEL(...)
    debug("Event: ", ...);
end
function events:TRADE_SHOW(...)
    debug("Event: ", ...);
end
function events:TRADE_SKILL_CLOSE(...)
    debug("Event: ", ...);
end
function events:TRADE_SKILL_FILTER_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRADE_SKILL_SHOW(...)
    debug("Event: ", ...);
end
function events:TRADE_SKILL_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRADE_TARGET_ITEM_CHANGED(...)
    debug("Event: ", ...);
end
function events:TRADE_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRAINER_CLOSED(...)
    debug("Event: ", ...);
end
function events:TRAINER_DESCRIPTION_UPDATE(...)
    debug("Event: ", ...);
end
function events:TRAINER_SHOW(...)
    debug("Event: ", ...);
end
function events:TRAINER_UPDATE(...)
    debug("Event: ", ...);
end
function events:TUTORIAL_TRIGGER(...)
    debug("Event: ", ...);
end
function events:UI_ERROR_MESSAGE(...)
    debug("Event: ", ...);
end
function events:UI_INFO_MESSAGE(...)
    debug("Event: ", ...);
end
function events:UNIT_ATTACK(...)
    debug("Event: ", ...);
end
function events:UNIT_ATTACK_POWER(...)
    debug("Event: ", ...);
end
function events:UNIT_ATTACK_SPEED(...)
    debug("Event: ", ...);
end
function events:UNIT_AURA(...)
    debug("Event: ", ...);
end
function events:UNIT_CLASSIFICATION_CHANGED(...)
    debug("Event: ", ...);
end
function events:UNIT_COMBAT(...)
    debug("Event: ", ...);
end
function events:UNIT_COMBO_POINTS(...)
    debug("Event: ", ...);
end
function events:UNIT_DAMAGE(...)
    debug("Event: ", ...);
end
function events:UNIT_DEFENSE(...)
    debug("Event: ", ...);
end
function events:UNIT_DISPLAYPOWER(...)
    debug("Event: ", ...);
end
function events:UNIT_DYNAMIC_FLAGS(...)
    debug("Event: ", ...);
end
function events:UNIT_ENERGY(...)
    debug("Event: ", ...);
end
function events:UNIT_ENTERED_VEHICLE(...)
    debug("Event: ", ...);
end
function events:UNIT_ENTERING_VEHICLE(...)
    debug("Event: ", ...);
end
function events:UNIT_EXITED_VEHICLE(...)
    debug("Event: ", ...);
end
function events:UNIT_EXITING_VEHICLE(...)
    debug("Event: ", ...);
end
function events:UNIT_FACTION(...)
    debug("Event: ", ...);
end
function events:UNIT_FLAGS(...)
    debug("Event: ", ...);
end
function events:UNIT_FOCUS(...)
    debug("Event: ", ...);
end
function events:UNIT_HAPPINESS(...)
    debug("Event: ", ...);
end
function events:UNIT_HEALTH(...)
    debug("Event: ", ...);
end
function events:UNIT_INVENTORY_CHANGED(...)
    debug("Event: ", ...);
end
function events:UNIT_LEVEL(...)
    debug("Event: ", ...);
end
function events:UNIT_MANA(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXENERGY(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXFOCUS(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXHAPPINESS(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXHEALTH(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXMANA(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXRAGE(...)
    debug("Event: ", ...);
end
function events:UNIT_MAXRUNIC_POWER(...)
    debug("Event: ", ...);
end
function events:UNIT_MODEL_CHANGED(...)
    debug("Event: ", ...);
end
function events:UNIT_NAME_UPDATE(...)
    debug("Event: ", ...);
end
function events:UNIT_PET(...)
    debug("Event: ", ...);
end
function events:UNIT_PET_EXPERIENCE(...)
    debug("Event: ", ...);
end
function events:UNIT_PORTRAIT_UPDATE(...)
    debug("Event: ", ...);
end
function events:UNIT_QUEST_LOG_CHANGED(...)
    debug("Event: ", ...);
end
function events:UNIT_RAGE(...)
    debug("Event: ", ...);
end
function events:UNIT_RANGEDDAMAGE(...)
    debug("Event: ", ...);
end
function events:UNIT_RANGED_ATTACK_POWER(...)
    debug("Event: ", ...);
end
function events:UNIT_RESISTANCES(...)
    debug("Event: ", ...);
end
function events:UNIT_RUNIC_POWER(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_CHANNEL_START(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_CHANNEL_STOP(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_CHANNEL_UPDATE(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_DELAYED(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_FAILED(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_FAILED_QUIET(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_INTERRUPTED(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_INTERRUPTIBLE(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_NOT_INTERRUPTIBLE(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_SENT(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_START(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_STOP(...)
    debug("Event: ", ...);
end
function events:UNIT_SPELLCAST_SUCCEEDED(...)
    debug("Event: ", ...);
end
function events:UNIT_STATS(...)
    debug("Event: ", ...);
end
function events:UNIT_TARGET(...)
    debug("Event: ", ...);
end
function events:UNIT_THREAT_LIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:UNIT_THREAT_SITUATION_UPDATE(...)
    debug("Event: ", ...);
end
function events:UPDATE_BATTLEFIELD_SCORE(...)
    debug("Event: ", ...);
end
function events:UPDATE_BATTLEFIELD_STATUS(...)
    debug("Event: ", ...);
end
function events:UPDATE_BINDINGS(...)
    debug("Event: ", ...);
end
function events:UPDATE_BONUS_ACTIONBAR(...)
    debug("Event: ", ...);
end
function events:UPDATE_CHAT_COLOR(...)
    debug("Event: ", ...);
end
function events:UPDATE_CHAT_COLOR_NAME_BY_CLASS(...)
    debug("Event: ", ...);
end
function events:UPDATE_CHAT_WINDOWS(...)
    debug("Event: ", ...);
end
function events:UPDATE_EXHAUSTION(...)
    debug("Event: ", ...);
end
function events:UPDATE_FACTION(...)
    debug("Event: ", ...);
end
function events:UPDATE_FLOATING_CHAT_WINDOWS(...)
    debug("Event: ", ...);
end
function events:UPDATE_GM_STATUS(...)
    debug("Event: ", ...);
end
function events:UPDATE_INSTANCE_INFO(...)
    debug("Event: ", ...);
end
function events:UPDATE_INVENTORY_ALERTS(...)
    debug("Event: ", ...);
end
function events:UPDATE_INVENTORY_DURABILITY(...)
    debug("Event: ", ...);
end
function events:UPDATE_LFG(...)
    debug("Event: ", ...);
end
function events:UPDATE_LFG_LIST(...)
    debug("Event: ", ...);
end
function events:UPDATE_LFG_LIST_INCREMENTAL(...)
    debug("Event: ", ...);
end
function events:UPDATE_LFG_TYPES(...)
    debug("Event: ", ...);
end
function events:UPDATE_MACROS(...)
    debug("Event: ", ...);
end
function events:UPDATE_MASTER_LOOT_LIST(...)
    debug("Event: ", ...);
end
function events:UPDATE_MOUSEOVER_UNIT(...)
    debug("Event: ", ...);
end
function events:UPDATE_MULTI_CAST_ACTIONBAR(...)
    debug("Event: ", ...);
end
function events:UPDATE_PENDING_MAIL(...)
    debug("Event: ", ...);
end
function events:UPDATE_SHAPESHIFT_COOLDOWN(...)
    debug("Event: ", ...);
end
function events:UPDATE_SHAPESHIFT_FORM(...)
    debug("Event: ", ...);
end
function events:UPDATE_SHAPESHIFT_FORMS(...)
    debug("Event: ", ...);
end
function events:UPDATE_SHAPESHIFT_USABLE(...)
    debug("Event: ", ...);
end
function events:UPDATE_STEALTH(...)
    debug("Event: ", ...);
end
function events:UPDATE_TICKET(...)
    debug("Event: ", ...);
end
function events:UPDATE_TRADESKILL_RECAST(...)
    debug("Event: ", ...);
end
function events:UPDATE_WORLD_STATES(...)
    debug("Event: ", ...);
end
function events:USE_BIND_CONFIRM(...)
    debug("Event: ", ...);
end
function events:USE_GLYPH(...)
    debug("Event: ", ...);
end
function events:VARIABLES_LOADED(...)
    debug("Event: ", ...);
end
function events:VEHICLE_ANGLE_SHOW(...)
    debug("Event: ", ...);
end
function events:VEHICLE_ANGLE_UPDATE(...)
    debug("Event: ", ...);
end
function events:VEHICLE_PASSENGERS_CHANGED(...)
    debug("Event: ", ...);
end
function events:VEHICLE_POWER_SHOW(...)
    debug("Event: ", ...);
end
function events:VEHICLE_UPDATE(...)
    debug("Event: ", ...);
end
function events:VOICE_CHANNEL_STATUS_UPDATE(...)
    debug("Event: ", ...);
end
function events:VOICE_CHAT_ENABLED_UPDATE(...)
    debug("Event: ", ...);
end
function events:VOICE_LEFT_SESSION(...)
    debug("Event: ", ...);
end
function events:VOICE_PLATE_START(...)
    debug("Event: ", ...);
end
function events:VOICE_PLATE_STOP(...)
    debug("Event: ", ...);
end
function events:VOICE_PUSH_TO_TALK_START(...)
    debug("Event: ", ...);
end
function events:VOICE_PUSH_TO_TALK_STOP(...)
    debug("Event: ", ...);
end
function events:VOICE_SELF_MUTE(...)
    debug("Event: ", ...);
end
function events:VOICE_SESSIONS_UPDATE(...)
    debug("Event: ", ...);
end
function events:VOICE_START(...)
    debug("Event: ", ...);
end
function events:VOICE_STATUS_UPDATE(...)
    debug("Event: ", ...);
end
function events:VOICE_STOP(...)
    debug("Event: ", ...);
end
function events:VOICE_TALKER_START_PARTY(...)
    debug("Event: ", ...);
end
function events:VOICE_TALKER_START_RAID(...)
    debug("Event: ", ...);
end
function events:VOICE_TALKER_STOP_PARTY(...)
    debug("Event: ", ...);
end
function events:VOICE_TALKER_STOP_RAID(...)
    debug("Event: ", ...);
end
function events:WEAR_EQUIPMENT_SET(...)
    debug("Event: ", ...);
end
function events:WHO_LIST_UPDATE(...)
    debug("Event: ", ...);
end
function events:WORLD_MAP_NAME_UPDATE(...)
    debug("Event: ", ...);
end
function events:WORLD_MAP_UPDATE(...)
    debug("Event: ", ...);
end
function events:WORLD_STATE_UI_TIMER_UPDATE(...)
    debug("Event: ", ...);
end
function events:ZONE_CHANGED(...)
    debug("Event: ", ...);
end
function events:ZONE_CHANGED_INDOORS(...)
    debug("Event: ", ...);
end
function events:ZONE_CHANGED_NEW_AREA(...)
    debug("Event: ", ...);
end

function load(self)
    print("Loaded DataBar. v0.50");
    this = self;
    frame = CreateFrame("FRAME", "DataBar");
    frame:SetScript("OnUpdate", update);
    frame:SetScript("OnEvent", function(self, event, ...)
        print("START: " .. event);
        events[event](event, ...); -- call one of the functions above
        print("END");
    end);
    for k, v in pairs(events) do
        frame:RegisterEvent(k); -- Register all events for which handlers have been defined
    end
end

function debug(str, ...)
--    print(str);
    if arg1 ~= nil then
        print(arg1);
    end
    if arg2 == true then
        print("true");
    else
        print("false");
    end
    if arg3 ~= nil then
        print(arg3);
    end
    if arg4 ~= nil then
        print(arg4);
    end
    if arg5 ~= nil then
        print(arg5);
    end
    if arg6 ~= nil then
        print(arg6);
    end
    if arg7 ~= nil then
        print(arg7);
    end
    if arg8 ~= nil then
        print(arg8);
    end
    if arg9 ~= nil then
        print(arg9);
    end
    if arg10 ~= nil then
        print(arg10);
    end
end