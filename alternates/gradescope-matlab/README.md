# Gradescope - Non-interactive MATLAB workflow for programming assignment grading

This is a customized non-interactive workflow that implements a 
Gradescope autograder. Follow build instructionst for MATLAB non-interactive
workflows, with small modifications.

## Modify the package MPM configuration

Edit configuration file (../../mpm-input-files/r2024a), uncommenting required packages.

## Build the containter
At shell prompt, type:
```bash
docker build -t gradescrope-matlab:r2024a .
```

## Run the container
Using docker or podman:
```bash
docker run --init --rm gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< /home/marek/Documents/MLM_LICENSE_TOKEN.txt)" "rand"

This will generate a single random number.

A more practical example:
```bash
podman run --init --rm -v /tmp:/tmp gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< $HOME/Documents/MLM_LICENSE_TOKEN.txt)" "imwrite(eye(3),'/tmp/foo.png','PNG')"
```
This writes an image to a file /tmp/foo.png on the host file system, since we mapped 
the docker image directory /tmp to the host directory /tmp.

Note that this example requires obtaining the batch token from MathWorks to be able to execute matlab non-interactively. In this example, we
assumed that the token is stored in the file $HOME/MLM_LICENSE_TOKEN.txt on the host running docker or podman.
