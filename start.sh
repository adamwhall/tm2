#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# -----------------------------------------------------------------------------

if [ ! -f /srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then
    wget "http://192.168.10.4/ManiaPlanetBetaServer_2015-06-16.zip" -O /srv/ManiaPlanetBetaServer_2015-06-16.zip
    #wget "http://files.maniaplanet.com/ManiaPlanet3Beta/ManiaPlanetBetaServer_2015-06-16.zip" -O /srv/ManiaPlanetBetaServer_2015-06-16.zip
fi

if [ -f /srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then  
   unzip /srv/ManiaPlanetBetaServer_2015-06-16.zip -d /srv/
fi

if [ -f /srv/UserData/Config/dedicated_cfg.default.txt ]
then
    cp /srv/UserData/Config/dedicated_cfg.default.txt /srv/UserData/Config/dedicated_cfg 
fi

if [ -f /srv/RunSrvTM.sh ]
then
    # echo "./srv/ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /srv/RunSrvTM.sh
    echo "./srv/ManiaPlanetServer /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt /title=TMStadium" > /srv/RunSrvTM.sh
fi

./srv/RunSrvTM.sh