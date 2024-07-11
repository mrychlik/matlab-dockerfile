docker build -t gradescrope-matlab:r2024a .
docker run --init --rm gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< /home/marek/Documents/MLM_LICENSE_TOKEN.txt)" "rand"

podman run --init --rm -v /tmp:/tmp gradescrope-matlab:r2024a matlab-batch -licenseToken "$(< /home/marek/Documents/MLM_LICENSE_TOKEN.txt)" "imwrite(eye(3),'/tmp/foo.png','PNG')"
