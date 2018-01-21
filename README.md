# fifty_fifty

* Uses token authentication that depends on an `AUTH_TOKEN` environment variable being set
* single endpoint at `/fifty_fifty`
* Responds with 401 if token doesn't match
* Responds roughly half the time with a word from the dictionary typically stored on unix systems at `/usr/share/dict/words`
* Reponds roughly half the time with a 500
* Uses puma to respond to parallel requests
* Tests in `/test` folder
