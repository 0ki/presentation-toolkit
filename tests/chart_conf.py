# -*- coding: utf-8 -*-

colors_[0] = ['#404040','#B0B0B0'] # give me a darker gray

edgecolors_ = ['#000000', '#FFFFFF']

intellicolors.update ({
	'cats':[ '#904617' , '#f3ddc6' ],
	'dogs':[ '#35343c' , '#ae673b' ],
	'water': '#1040a4',
	'userfiles': '#00bb30',
	'systemfiles': '#1010cd',
	'malware': '#ee1020',
	u'lipīgais medus': '#a98307',
	'ledus': '#a5f2f3',
	u'skābās zemenes': '#fc5a8d',
	u'saldie ķirši': '#790604',
})

font_preference = ['Verdana', 'Sans']

font.update({
 'weight' : 'normal',
})

legendstyle.update({
 'fontsize' : legendstyle['fontsize']-4
})

labelstyle.update({
 'fontsize': 26
})


fitstyle.update({
	'linewidth': 4,
	'linestyle': '--'
})

barstyle.update({
	'hatch': '/\\'
})

wedgestyle.update({
	'startangle': -45
})

scatterstyle.update({
	's': 150.0,
	'marker': 'o',
	'edgecolors': 'none'
})

plotstyle.update({
	'marker': 'H'
})

# gridstyle.update({})
# gridstyleminor.update({})


limit_vertical = 7
alpha = 0.6

plt.rcParams['hatch.linewidth']=0.2

dateformat = '%H:%M:%S'

plotlimit_left = 2000

