#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# tm2:latest
# -----------------------------------------------------------------------------

if [ ! -f /tm2srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then
    wget "http://192.168.10.4/ManiaPlanetBetaServer_2015-06-16.zip" -O /tm2srv/ManiaPlanetBetaServer_2015-06-16.zip
    #wget "http://files.maniaplanet.com/ManiaPlanet3Beta/ManiaPlanetBetaServer_2015-06-16.zip" -O /tm2srv/ManiaPlanetBetaServer_2015-06-16.zip
fi

if [ -f /tm2srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then  
   unzip /tm2srv/ManiaPlanetBetaServer_2015-06-16.zip -d /tm2srv/
fi

if [ -f /tm2srv/UserData/Config/dedicated_cfg.default.txt ]
then
    cp /tm2srv/UserData/Config/dedicated_cfg.default.txt /tm2srv/UserData/Config/dedicated_cfg.txt
fi

if [ -f /tm2srv/RunSrvTM.sh ]
then
    # echo "./tm2srv/ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /tm2srv/RunSrvTM.sh
    # echo "./tm2srv/ManiaPlanetServer /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt /title=TMStadium" > /tm2srv/RunSrvTM.sh
    echo "./tm2srv/ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /tm2srv/RunSrvTM.sh
fi

cd /tm2srv/
./RunSrvTM.sh
