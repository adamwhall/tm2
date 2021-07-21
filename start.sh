#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# -----------------------------------------------------------------------------

if [ ! -f /srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then
    wget "http://files.maniaplanet.com/ManiaPlanet3Beta/ManiaPlanetBetaServer_2015-06-16.zip" -O /srv/ManiaPlanetBetaServer_2015-06-16.zip
fi

if [ ! -f /srv/RunSrvTM.sh ]
then
    echo "./ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /srv/RunSrvTM.sh
fi


cd /srv/ && ./RunSrvTM.sh