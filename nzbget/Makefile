WORKDIR = $(PWD)/testing/build

nzbget-testing: testing/Dockerfile nzbget-build
	cd testing && docker build -t ey3ball/nzbget:testing ./
	@touch nzbget-testing

nzbget-build: build/Dockerfile nzbget-env $(WORKDIR)
	cd build && docker build -t ey3ball/nzbget-build:latest ./
	cd build && docker run -v $(WORKDIR):/build -i -t ey3ball/nzbget-build:latest
	@touch nzbget-build

$(WORKDIR):
	mkdir -p $(WORKDIR)

nzbget-env: env-testing/Dockerfile
	cd env-testing && docker build -t ey3ball/nzbget-env:latest ./
	@touch nzbget-env

clean:
	docker rmi ey3ball/nzbget:testing ey3ball/nzbget-build:latest ey3ball/nzbget-env:latest
