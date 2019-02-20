# This program will print its own source when run.

def print_source(f, s):
	f.write(s.format(s = s, q = chr(34)))

def ft(x):
	if __name__ == '__main__':
		try:
			with open('Grace_kid.py', 'w') as f:
				print_source(f, x)
		except:
			exit(1)

source = """# This program will print its own source when run.

def print_source(f, s):
	f.write(s.format(s = s, q = chr(34)))

def ft(x):
	if __name__ == '__main__':
		try:
			with open('Grace_kid.py', 'w') as f:
				print_source(f, x)
		except:
			exit(1)

source = {q}{q}{q}{s}{q}{q}{q}

ft(source)
"""

ft(source)
