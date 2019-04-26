#!/usr/bin/python -c
import json, sys, time
jsonout = json.loads(sys.stdin.read())

for i in jsonout["imageDetails"]:
	i['imagePushedAt'] = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(i['imagePushedAt']))

print(json.dumps(jsonout))
