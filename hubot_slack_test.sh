#!/bin/bash
 
HEROKU_URL="$1"
if [ -z "$HEROKU_URL" ] ; then
	HEROKU_URL=`heroku config:get HEROKU_URL`
fi
 
SLACK_URI="$HEROKU_URL/hubot/slack-webhook"
CODE=`curl -sL -w "%{http_code}" -o /dev/null -d "" "$SLACK_URI"`
echo "POST to $SLACK_URI code $CODE" >&2
 
if [ "$CODE" -ne "200" ] ; then
	echo "not cool" >&2
	exit 1
fi
 
echo "cool" >&2