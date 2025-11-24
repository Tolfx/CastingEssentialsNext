#include <sourcemod>
#include <sdktools>
#include "tfdb"

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
  name        = "CastingEssentials Dodgeball Events",
  author      = "CastingEssentials",
  description = "Fires game events for CastingEssentials dodgeball camera",
  version     = "1.0",
  url         = ""
};

// Forward from tf2_dodgeball
// forward Action TFDB_OnRocketDeflectPre(int iIndex, int iEntity, int iOwner, int &iTarget);
public void OnPluginStart()
{
}

public Action TFDB_OnRocketDeflectPre(int iIndex, int iEntity, int iOwner, int &iTarget)
{
  for (int i = 1; i <= MaxClients; i++)
  {
    if (IsClientInGame(i) && (IsClientSourceTV(i) || !IsFakeClient(i)))
    {
      ClientCommand(i, "ce_cameratools_on_deflect %d", iTarget);
    }
  }

  return Plugin_Continue;
}

public void TFDB_OnRocketCreated(int iEntity, int iOwner)
{
  for (int i = 1; i <= MaxClients; i++)
  {
    if (IsClientInGame(i) && (IsClientSourceTV(i) || !IsFakeClient(i)))
    {
      ClientCommand(i, "ce_cameratools_on_rocket_spawn %d", iEntity);
    }
  }
}