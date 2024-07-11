# Run with
#   make grade s=DIR
# where DIR is the current subdirectory that holds the student's work:
# e.g.,
#   make grade s=sq/s1
# for now `grade` is the default target, so
#   make s=sq/s1
# suffices

# Grade with reasonable simulation of Gradescope's script setup
grade:
	rm -rf autograder
	mkdir autograder/
	mkdir autograder/results/
	docker run -ti \
		-v `pwd`/tests/$(s):/autograder/submission \
		-v `pwd`/autograder/results:/autograder/results \
		localhost/gradescope-matlab /autograder/run_autograder
	printf "\n\n"
	cat autograder/results/results.json
	printf "\n\n"

base-image: Dockerfile.gradescope-matlab-base
	docker build -f Dockerfile.gradescope-matlab-base -t gradescope-matlab-base .

grader-image: base-image
	docker build -f Dockerfile.grader-image -t gradescope-matlab .

tag: 
	docker image tag localhost/gradescope-matlab rychlik/autograders:matlab

push: tag
	docker push rychlik/autograders:matlab
