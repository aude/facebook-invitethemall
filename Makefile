version = $(shell grep -oP '\/\/ @version\s+\K\S+' dist/facebook-invitethemall.meta.js)

dist: *.user.js
	cp $< dist
	awk '/\/\/ ==UserScript==/,/\/\/ ==\/UserScript==|^$$/' $< > dist/$(subst user,meta,$<)

push: dist
	echo ${version}
	#git add .
	#git commit -m ${version}
	#git push

clean:
	rm dist/*
