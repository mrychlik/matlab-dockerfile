# Run with
#   make grade s=DIR
# where DIR is the current subdirectory that holds the student's work:
# e.g.,
#   make grade s=sq/s1
# for now `grade` is the default target, so
#   make s=sq/s1
# suffices
# Grade with reasonable simulation of Gradescope's script setup


MLM_LICENSE_TOKEN=$(shell cat /home/marek/Documents/MLM_LICENSE_TOKEN.txt)

grade:
	rm -rf autograder
	mkdir -p autograder/results/
	touch autograder/results/results.json
	docker run -ti \
		-v `pwd`/autograder/results:/autograder/results \
		-e LICENSE_TOKEN='$(MLM_LICENSE_TOKEN)' \
	       localhost/gradescope-matlab-autograder:latest
	printf "\n\n"
	cat autograder/results/results.json
	printf "\n\n"

base-image: Dockerfile.gradescope-matlab-base
	docker build -f Dockerfile.gradescope-matlab-base -t localhost/gradescope-matlab-base .

grader-image: base-image
	docker build -f Dockerfile.grader-image -t localhost/gradescope-matlab-autograder .

# tag: 
# 	docker image tag localhost/gradescope-matlab rychlik/autograders:matlab

# push: tag
# 	docker push rychlik/autograders:matlab
