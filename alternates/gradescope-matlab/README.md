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

docker run --init --rm gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< /home/marek/Documents/MLM_LICENSE_TOKEN.txt)" "rand"

## Run the container

podman run --init --rm -v /tmp:/tmp gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< /home/marek/Documents/MLM_LICENSE_TOKEN.txt)" "imwrite(eye(3),'/tmp/foo.png','PNG')"
