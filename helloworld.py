retryCount = 5

while retryCount > 0:

	print str(retryCount) + " more retries left ... "

	match = False
	while not match :
		if retryCount == 2 :
			match = True
			print "Match found"
		else:
			print "Match not found"
		if match:
			retryCount = 0
		else:
			retryCount = retryCount - 1

