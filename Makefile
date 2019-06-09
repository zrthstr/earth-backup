


install_blender:
	@echo ">> File:User Preference:Input> Emulate 3 button mouse | Emulate Numpad"
	sudo pacman -S blender

install_ere:
	git clone https://github.com/retroplasma/earth-reverse-engineering
	cd earth-reverse-engineering && git pull
	sudo pacman -S npm
	cd earth-reverse-engineering && npm install

install: install_blender install_ere

all:
	cd earth-reverse-engineering && \
	node lat_long_to_octant.js 37.420806884765625 -122.08419799804688

	cd earth-reverse-engineering && \
	node dump_obj.js 20527061605273514 20

	@echo "The obj files aren't centered or resized per default."
	@echo "center_scale_obj.js takes care of that and produces model.2.obj from model.obj."
	cd earth-reverse-engineering && \
	node center_scale_obj.js


test:
	# https://plus.codes/9F4MFCX9+M5

	cd earth-reverse-engineering && \
	node lat_long_to_octant.js 52.499187 13.417938

	# => Octant Level: 18
	# { n: 52.499542236328125,
	# s: 52.4981689453125,
	# w: 13.41705322265625,
	# e: 13.4197998046875 }
	# 306043425342434341
	# 306043425342434345

	cd earth-reverse-engineering && \
	node dump_obj.js 30604342534243434  20


more: info
	cd earth-reverse-engineering && \
	time node dump_obj.js 3060434253424343  20

more0: info
	cd earth-reverse-engineering && \
	time node dump_obj.js 306043425342434  20

more1: info
	cd earth-reverse-engineering && \
	time node dump_obj.js 30604342534243  20

more2: info
	cd earth-reverse-engineering && \
	time node dump_obj.js 3060434253424  20

info:
	du -sh objs/*
