# presentation-toolkit
Sleek tools to create and show presentations. These tools work on Linux, but can be made to work on other platforms too with some or a lot of effort (depending on the tool).

#### Here's a quick guide to get you started in life
```
dd if=/dev/urandom count=1000 | tr -dc 0-9 | sed -E 's/(..).(...).(...)./\1 \2 \3\n/g' | head -15 | chart plotscatter /tmp/test.png noheader dark show
dd if=/dev/urandom count=1000 | tr -dc 0-9 | sed -E 's/(..).(...).(...)./\1 \2 \3\n/g' | head -15 | chart bar /tmp/test.png noheader dark show
dd if=/dev/urandom count=1000 | tr -dc 0-9 | sed -E 's/(..).(...).(...)./\1 \2 \3\n/g' | head -15 | chart pie /tmp/test.png noheader dark show
image-invert /tmp/test.png 
termshot /tmp/test2.png hexcolordump -as /tmp/test.png 
```

### Is there anything else?
Yes!

https://github.com/FireyFly/pixd

https://github.com/0ki/binGraph

https://github.com/cortesi/scurve/blob/master/binvis


### Tips and tricks:
* General speaking tips and tricks

https://twitter.com/jesslynnrose/status/1041242744998572032

* Having the same terminal on your extended screen for the beamer
1. terminal 1: `screen -S presenting`
1. terminal 2: `screen -x presenting`
1. move one of the terminals to the other screen
Thanks to @leyrer & @MacLemon
