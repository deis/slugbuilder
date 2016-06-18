def parse_procfile_keys(fp):
	keys = []
	for line in fp:
		splitline = line.split(': ', 1)
		if len(splitline) != 2:
			# skip bad lines
			continue
		keys.append(splitline[0])
	return keys
