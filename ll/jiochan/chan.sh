#!/usr/bin/env bash

# Get channel list
curl -sL -X GET 'http://jiotv.data.cdn.jio.com/apis/v1.4/getMobileChannelList/get/?os=android&devicetype=phone&version=7.0.5' | python3 -m json.tool >>./new.json
echo 'Got json'

# Add target key
node -e 'const fs = require("fs");
const channels = require("./new.json");
const path = "./channels.json";

channels.result.forEach((object) => {
    object.target = channels.result.forEach((obj) => (obj.target = obj.logoUrl.replace(/.png/gi, "")));
});

const b = JSON.stringify(channels);
const xj = JSON.stringify(JSON.parse(b), null, 2);

if (fs.existsSync(path)) {
    console.log("exists:", path);
    fs.unlinkSync(path);
    console.log("deleting:", path);

    fs.writeFile("channels.json", xj, (err) => {
        console.log("creating new :", path);

        if (err) throw err;
    });
} else {
    fs.writeFile("channels.json", xj, (err) => {
        console.log("creating new :", path);

        if (err) throw err;
    });
}
'
echo 'Fucked target'

# Cleanup
rm -rf ./new.json
echo 'Cleanup & xit'
