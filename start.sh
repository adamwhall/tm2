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
    echo "<?xml version="1.0" encoding="utf-8" ?>

<dedicated>
	<authorization_levels>
		<level>
			<name>SuperAdmin</name>
			<password>ez2forget!</password>
		</level>
		<level>
			<name>Admin</name>
			<password>ez2forget</password>
		</level>
		<level>
			<name>User</name>
			<password>ezy2forget</password>
		</level>
	</authorization_levels>
	
 	<masterserver_account>
		<login>sec8tm2server</login>
		<password>Ez2forget!</password>
		<validation_key>HAMYU</validation_key>
	</masterserver_account>
	
	<server_options>
		<name>Section 8 TrackMania</name>
		<comment></comment>
		<hide_server>0</hide_server>					<!-- value is 0 (always shown), 1 (always hidden), 2 (hidden from nations) -->

		<max_players>32</max_players>
		<password></password>
		
		<max_spectators>32</max_spectators>
		<password_spectator></password_spectator>
	
		<keep_player_slots>False</keep_player_slots>			<!-- when a player changes to spectator, hould the server keep if player slots/scores etc.. or not. --> 	
		<ladder_mode>forced</ladder_mode>				<!-- value between 'inactive', 'forced' (or '0', '1') -->
		
		<enable_p2p_upload>True</enable_p2p_upload>
		<enable_p2p_download>False</enable_p2p_download>
		
		<callvote_timeout>60000</callvote_timeout>
		<callvote_ratio>0.5</callvote_ratio>				<!-- default ratio. value in [0..1], or -1 to forbid. -->
		<callvote_ratios>
			<voteratio command="Ban" ratio="-1"/>
			<!-- commands can be "Ban", "Kick", "RestartMap", "NextMap", "SetModeScriptSettingsAndCommands"... -->
		</callvote_ratios>

		<allow_map_download>True</allow_map_download>
		<autosave_replays>False</autosave_replays>
		<autosave_validation_replays>False</autosave_validation_replays>

		<referee_password></referee_password>
		<referee_validation_mode>0</referee_validation_mode>		<!-- value is 0 (only validate top3 players),  1 (validate all players) -->

		<use_changing_validation_seed>False</use_changing_validation_seed>

		<disable_horns>False</disable_horns>
		<clientinputs_maxlatency>0</clientinputs_maxlatency>		<!-- 0 mean automatic adjustement -->
	</server_options>
	
	<system_config>
		<connection_uploadrate>8000</connection_uploadrate>		<!-- Kbits per second -->
		<connection_downloadrate>8000</connection_downloadrate>		<!-- Kbits per second -->

		<allow_spectator_relays>False</allow_spectator_relays>

		<p2p_cache_size>600</p2p_cache_size>

		<force_ip_address></force_ip_address>
		<server_port>2350</server_port>
		<server_p2p_port>3450</server_p2p_port>
		<client_port>0</client_port>
		<bind_ip_address></bind_ip_address>
		<use_nat_upnp></use_nat_upnp>

		<gsp_name></gsp_name>						<!-- Game Server Provider name and info url -->
		<gsp_url></gsp_url>						<!-- If you're a server hoster, you can use this to advertise your services -->

		<xmlrpc_port>5000</xmlrpc_port>
		<xmlrpc_allowremote>False</xmlrpc_allowremote>			<!-- If you specify an ip adress here, it'll be the only accepted adress. this will improve security. -->

		<scriptcloud_source>nadeocloud</scriptcloud_source>		<!-- Specify the cloud storage mode for Titles that use it. Can be "localdebug" or "xmlrpc" or "nadeocloud" (default). "nadeocloud" will work only if the creator of the title subscribed to the cloud service. -->

		
		<blacklist_url></blacklist_url>
		<guestlist_filename></guestlist_filename>
		<blacklist_filename></blacklist_filename>
		
		<title>Canyon</title>		<!-- SMStorm, TMCanyon, ... -->

		<minimum_client_build></minimum_client_build>			<!-- Only accept updated client to a specific version. ex: 2011-10-06 -->

		<disable_coherence_checks>False</disable_coherence_checks>	<!-- disable internal checks to detect issues/cheats, and reject race times -->

		<disable_replay_recording>False</disable_replay_recording>	<!-- disable replay recording in memory during the game to lower memory usage. -->

		<use_proxy>False</use_proxy>
		<proxy_login></proxy_login>
		<proxy_password></proxy_password>
	</system_config>
</dedicated>"
fi

if [ -f /tm2srv/UserData/Config/dedicated_cfg.default.txt ]
then
    cp /tm2srv/UserData/Config/dedicated_cfg.default.txt /tm2srv/UserData/Config/dedicated_cfg.txt
fi

cd /tm2srv/

if [ -f RunSrvTM.sh ]
then
    echo "./ManiaPlanetServer /title=TMStadium /game_settings=MatchSettings/TMStadiumB.txt /dedicated_cfg=dedicated_cfg.txt" > /RunSrvTM.sh
fi

cd /tm2srv/

./RunSrvTM.sh
