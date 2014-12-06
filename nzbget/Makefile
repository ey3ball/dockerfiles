SHELL = /bin/bash
WORKDIR = $(PWD)/install/build

ifndef TARGET
TARGET = latest
endif

ifneq ($(shell cat .nzbget-target), $(TARGET))
$(shell echo $(TARGET) > .nzbget-target)
endif

#nzbget-testing: testing/Dockerfile nzbget-build
#	cd testing && docker build -t ey3ball/nzbget:testing ./
#	@touch nzbget-testing

install: .nzbget-install

.nzbget-install: .nzbget-build install/Dockerfile
	cd install && docker build -t ey3ball/nzbget:$(TARGET) ./
	@touch .nzbget-install

install/Dockerfile: install/Dockerfile.install .nzbget-target
	cd install && cat Dockerfile.install | sed "s/%TARGET%/$(TARGET)/g" > Dockerfile

.nzbget-build: build/Dockerfile .nzbget-env-$(TARGET) $(WORKDIR)
	cd build && cat Dockerfile | sed "s/%TARGET%/$(TARGET)/g" |\
	  docker build -t ey3ball/nzbget-build:$(TARGET) -
	cd build && docker run -v $(WORKDIR):/build -i -t ey3ball/nzbget-build:$(TARGET)
	@touch .nzbget-build

$(WORKDIR): .nzbget-target
	sudo rm -rf $(WORKDIR) && mkdir -p $(WORKDIR)

.nzbget-env-latest: env-testing/Dockerfile
	docker pull ubuntu:latest
	cd env-testing && docker build -t ey3ball/nzbget-env:latest ./
	@touch .nzbget-env-latest

.nzbget-env-stable: env-stable/Dockerfile
	docker pull ubuntu:latest
	cd env-stable && docker build -t ey3ball/nzbget-env:stable ./
	@touch .nzbget-env-stable

clean:
	docker rmi ey3ball/nzbget:testing ey3ball/nzbget-build:latest \
		ey3ball/nzbget-env:latest ey3ball/nzget-env:stable
