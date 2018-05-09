# 🚦 Jenkins traffic light

### Pre-Requisits
- [JQ](https://stedolan.github.io/jq/)
- [mpg123](http://www.linux-mag.com/id/7838/)
- [Traffic light](http://www.cleware-shop.de/USB-MiniTrafficLight-EN)

### Configuration

Just set your config variables and run the script.

- JENKINS_USER= basic auth in order to login to your jenkins
- JENKINS_PASSWORD= basic auth in order to login to your jenkins
- JENKINS_SERVER= URL to your jenkins
- JENKINS_JOB_NAME= Main jenkins job you want to check
- JENKINS_BRANCH_NAME= Sub branch name you want to check
- JENKINS_TIME_BETWEEN_CALLS= Time between calls (recommended 60 sec)
- DEVICE_NO= clearwarecontrol device number
- SOUND_FAILED= sound to play when the pipeline is red
- SOUND_SUCCESS= sound to play when the pipeline is green
-

## License
This project is released under the [WTFPL LICENSE](http://www.wtfpl.net/ "WTFPL LICENSE").
