## LEAKEY 🔑
[![leakeylogo.png](https://i.postimg.cc/0Qwzhz5V/leakeylogo.png)](https://postimg.cc/tZ9RxCx6)<br>
LEAKEY is a tool is for validation of leaked API tokens/keys found during pentesting and Red Team Enegagments.<br> 
The script is really useful for Bug Hunters inorder to validate and determine the impact of leaked credentials.

LEAKEY uses a json based signature file located at ```~/.leakey/signatures.json``` <br>
The idea behind LEAKEY is to make it highly customizable and easy to add new services/checks once they are discovered. 

LEAKEY loads the services/check list via the signature file, if you wish to add more Checks/services, simply append it in the ```signatures.json``` file

## Requirements:
* jq

## Installation:
```bash
curl https://raw.githubusercontent.com/rohsec/LEAKEY/master/install.sh -o leaky_install.sh && chmod +x leaky_install.sh && bash leaky_install.sh
```

## Usage:
After running the installation command, simply run the below in your terminal
```bash
leaky
```

## Adding Checks:
All the checks for LEAKEY are defined in the ```signatures.json``` file. <br>To add any new checks, simply appened the signatures file at ```~/.leakey/signatures.json```
```json
{
    "id": 0,
    "name": "Slack API Token",
    "args": [
      "token"
    ],
    "command": "curl -sX POST \"https://slack.com/api/auth.test?token=xoxp-$token&pretty=1\""
  }
``` 
## Screenshots:
[![leakey1.png](https://i.postimg.cc/J79517KX/leakey1.png)](https://postimg.cc/kDvbsm0M)<br>
[![leakey2.png](https://i.postimg.cc/Fs3g1tnB/leakey2.png)](https://postimg.cc/Yh2myP76) <br>
[![leakey3.png](https://i.postimg.cc/bJVSVgVb/leakey3.png)](https://postimg.cc/bDbvsxhN)

## Credits:
@streaa - https://github.com/streaak/keyhacks<br>
@udit-thakkur - https://github.com/udit-thakkur/AdvancedKeyHacks

## Legal Disclaimer:
The script is made for educational and ethical purposes only. Usage of the script for attacking targets without prior mutual consent is illegal. The developer is not responsible for any misuse or damage caused by this script.