#!/bin/bash
# -----------------------------------------------------------------------------
# TM2 /start.sh script
# tm2:latest v3.1:20220102
# -----------------------------------------------------------------------------

if [ ! -f /srv/ManiaplanetServer_Latest.zip ]
then
    wget "http://files.v04.maniaplanet.com/server/ManiaplanetServer_Latest.zip" -O /srv/ManiaplanetServer_Latest.zip
fi

if [ -f /srv/ManiaplanetServer_Latest.zip ]
then  
   unzip /srv/ManiaplanetServer_Latest.zip -d /srv/
fi

./srv/ManiaPlanetServer

if [ ! -f /srv/ManiaplanetServer_Latest.zip ]
then
    wget "https://v4.live.maniaplanet.com/ingame/public/titles/download/TMStadium@nadeo.Title.Pack.gbx" -O /srv/UserData/Packs/TMStadium@nadeo.Title.Pack.gbx
fi

if [ ! -f /srv/UserData/Config/dedicated_cfg.txt ]
then
    cp /srv/UserData/Config/dedicated_cfg.default.txt /srv/UserData/Config/dedicated_cfg.txt
fi

./srv/ManiaPlanetServer /nodaemon /internet /bindip=165.73.65.176 /dedicated_cfg=dedicated_cfg.txt /game_settings=MatchSettings/Settings.txt /Title=TMStadium@nadeo
#echo "./srv/ManiaPlanetServer /nodaemon /internet /dedicated_cfg=dedicated_cfg.txt /game_settings=MatchSettings/Settings.txt /Title=TMStadium@nadeo" > /RunSrvTM.sh