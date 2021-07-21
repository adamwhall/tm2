#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# -----------------------------------------------------------------------------

if [ ! -f /srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then
    wget "http://files.maniaplanet.com/ManiaPlanet3Beta/ManiaPlanetBetaServer_2015-06-16.zip" -O /srv/ManiaPlanetBetaServer_2015-06-16.zip
fi

if [ -f /srv/ManiaPlanetBetaServer_2015-06-16.zip ]
then  
   sudo unzip /srv/ManiaPlanetBetaServer_2015-06-16.zip -d /srv/
fi

# if [ ! -f /srv/UserData/Config/dedicated_cfg.default.txt ]
# then
#     cp /srv/UserData/Config/dedicated_cfg.default.txt /srv/UserData/Config/dedicated_cfg 
# fi

cp /srv/UserData/Config/dedicated_cfg.default.txt /srv/UserData/Config/dedicated_cfg

if [ ! -f /srv/RunSrvTM.sh ]
then
    echo "./ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /srv/RunSrvTM.sh
fi

#/bin/tm2 -s /bin/bash -c '/srv/RunSrvTM.sh' tm2

#usermod -aG sudo tm2
#sudo -u tm2 /srv/RunSrvTM.sh

./srv/RunSrvTM.sh