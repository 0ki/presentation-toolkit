# -*- coding: utf-8 -*-

import random

types=['α','β','γ']
with open('chart.13.in', 'w') as f13 , open('chart.14.in', 'w') as f14:
	f13.write('time,ms:energy,uV:type\n')
	f14.write('time,ms:energy,uV:type α β γ\n')
	emissionlimit = [random.randint(950,999) for pt in types]
	powerset = [ 300, 8000, 70000 ]
	for i in range(0,10000):
		ip = i/1000.0
		outs=[]
		for pt,c in enumerate(types):
			if random.randint(0,1000) > emissionlimit[pt]:
				power=random.random() * powerset[pt]*0.8 + powerset[pt]*0.2
				f13.write('%f %f %s\n' % (ip,power,c))
				outs.append(power)
			else:
				outs.append("-")
		f14.write('%f %s %s %s\n' % (ip, outs[0], outs[1], outs[2]))

