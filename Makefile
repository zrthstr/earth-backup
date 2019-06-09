
install_blender:
	@echo ">> File:User Preference:Input> Emulate 3 button mouse | Emulate Numpad"
	sudo pacman -S blender

install_ere:
	git clone
	cd earth-reverse-engineering
	npm install

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
	cd earth-reverse-engineering && \
	node lat_long_to_octant.js 37.420806884765625 -122.08419799804688
	
