import requests
import json
import os

link = "http://jiotv.data.cdn.jio.com/apis/v1.4/getMobileChannelList/get/?os=android&devicetype=phone&version=7.0.5"

try:
    responce = requests.get(link)
    print("\n\033[1;32m Getting data From API 🚀🚀\n")

except BaseException:
    print("\n\033[1;31m Something Wrong With API 😢")


channel_object = json.loads(responce.content)

print("\033[1;36m Doinnn Magikk 🪄 😁\n")

for i in channel_object["result"]:
    i.update({"target": i["logoUrl"].replace(".png", "")})

# print(json.dumps(channel_object, indent = 3))

if os.path.exists("channels.json"):
    print("\033[0;31m channels.json exists 😱\n")
    os.remove("channels.json")
    print("\033[1;32m The file has been deleted successfully 😌\n\n\033[0;34m Writing File ✍️\n")

    f = open("channels.json", "w")
    f.write(json.dumps(channel_object, indent=3))
    f.close()
    print("\033[0;32m All done! ✨ 🍰 ✨\n")
else:
    print("\033[0;32m The file does not exist 😮‍💨\n Writing File ✍️\n")
    f = open("channels.json", "w")
    f.write(json.dumps(channel_object, indent=3))
    f.close()
    print("\033[1m \033[0;32m All done! ✨ 🍰 ✨\n")
#
# Just to make it $) 40