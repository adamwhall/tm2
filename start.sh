#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# tm2:latest v2
# -----------------------------------------------------------------------------

if [ ! -f /tm2/ManiaplanetServer_Latest.zip ]
then
    wget "http://files.v04.maniaplanet.com/server/ManiaplanetServer_Latest.zip" -O /tm2/ManiaplanetServer_Latest.zip
fi

if [ -f /tm2/ManiaplanetServer_Latest.zip ]
then  
   unzip /tm2/ManiaplanetServer_Latest.zip -d /tm2/
fi

./tm2/ManiaPlanetServer

if [ -f /tm2/UserData/Config/dedicated_cfg.default.txt ]
then
    cp /tm2srv/UserData/Config/dedicated_cfg.default.txt /tm2/UserData/Config/dedicated_cfg.txt
fi

if [ -f /tm2/RunSrvTM.sh ]
then
    echo "./ManiaPlanetServer /nodaemon /dedicated_cfg=dedicated_cfg.txt /title=TMStadium@nadeo /game_settings=MatchSettings/TMStadiumA.txt" > /RunSrvTM.sh
fi

./tm2/RunSrvTM.sh
