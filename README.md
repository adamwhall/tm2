# tm2
TrackMania 2 Docker Container
Version 1.2

ALL information is around on the net, if you just look :)

CREDIT TO THE FOLLOWING SOURCES :
https://www.gamers.org/tm2/quickstart.html

# Things to do

1. edit /srv/server.properties
2. In the "authorization_levels" section, change all three passwords, but do not change the names (SuperAdmin, Admin, User).
3. In the "masterserver_account" section, enter the server "login" obtained above with its own "password", and your account's validation key (usually five characters) in "validation_key" so that your server is able to use planets. This validation key is given in the mail you should have received after creating your player account with the game, but a new one can be generated via the player page. Additionally, you must make an initial donation from your player login to your server login via the in-game message system, so that there are sufficient planets in the account to pay Nadeo tax on the first transaction. ( http://player.maniaplanet.com/account/validation-code )
4. In the "server_options" section, give your server a "name" and configure the other options to your liking.
5. Choose a "title": Canyon, Stadium, or Valley.
6. Choose and edit a match settings file, e.g. TM2/UserData/Maps/MatchSettings/TM"title"A.txt, to your liking (see the server readme for details, although that's for TMF so some things are different).
7. On your firewall/router, open the server port 2350 and the P2P port 3450 for both UDP and TCP traffic, but not the XMLRPC port 5000. For the Dedimania system in XASECO2 port 8002 needs to be open as well. For more information on this, PortForward.com may be useful.
8. A standard startup script called RunSrv.sh is included in the zip, so review/edit it if needed