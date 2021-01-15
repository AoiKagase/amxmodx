// vim: set ts=4 sw=4 tw=99 noet:
//
// AMX Mod X, based on AMX Mod by Aleksander Naszko ("OLO").
// Copyright (C) The AMX Mod X Development Team.
//
// This software is licensed under the GNU General Public License, version 3 or higher.
// Additional exceptions apply. For full license details, see LICENSE.txt or visit:
//     https://alliedmods.net/amxmodx-license

#include <amxmodx>
#include <nvault>

public plugin_init()
{
	register_plugin("nVault Test", "1.0", "BAILOPAN")
	
	register_srvcmd("test_nvault", "Command_TestNvault")
}

public Command_TestNvault()
{
	new v = nvault_open("://:/1/R!?#@41345$%:$")
	server_print("Vault value: %d (expected: %d)", v, -1)
	
	if (v != -1)
	{
		nvault_close(v)
	}
	new test = nvault_open("TEST");
	new timestamp = 0, value[10];
	nvault_set(test, "KEY", "16000");
	new rt = nvault_get(test, "KEY", value, charsmax(value));
	server_print("CODE: %d", rt);
	server_print("Vault value: %s (expected: %d) time:%d", value, 16000, timestamp)
	nvault_close(test);
	test = nvault_open("TEST");
	nvault_get(test, "KEY", value, charsmax(value));
	server_print("Vault value: %s (expected: %d) time:%d", value, 16000, timestamp)
	nvault_lookup(test, "KEY", value, charsmax(value), timestamp);
	server_print("Vault value: %s (expected: %d) time:%d", value, 16000, timestamp)
	nvault_close(test);
}
