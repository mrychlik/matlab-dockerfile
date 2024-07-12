# Run with
#   make grade s=DIR
# where DIR is the current subdirectory that holds the student's work:
# e.g.,
#   make grade s=sq/s1
# for now `grade` is the default target, so
#   make s=sq/s1
# suffices
# Grade with reasonable simulation of Gradescope's script setup


MLM_LICENSE_TOKEN=$(shell cat $$HOME/Documents/MLM_LICENSE_TOKEN.txt)
RESULTS_FILE=autograder/results/results.json

grade:
	rm -rf autograder
	mkdir -p autograder/results/
	docker run -ti \
		-u $(id -u):$(id -g) \
		-v `pwd`/autograder/results:/autograder/results:Z \
		-e LICENSE_TOKEN='$(MLM_LICENSE_TOKEN)' \
	       localhost/gradescope-matlab-autograder:latest
	printf "\n\n"
	cat $(RESULTS_FILE)
	printf "\n\n"

base-image: Dockerfile.gradescope-matlab-base
	docker build -f Dockerfile.gradescope-matlab-base \
		-t localhost/gradescope-matlab-base .

grader-image: 
	docker build -f Dockerfile.grader-image \
		-t localhost/gradescope-matlab-autograder .

tag: 
	docker image tag \
		localhost/gradescope-matlab-autograder \
		docker.io/rychlik/gradescope-matlab-base:latest


push: tag
	podman login docker.io
	podman push docker.io/rychlik/gradescope-matlab-base:latest
