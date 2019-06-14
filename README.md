# Getting started
This repo uses Docker to build and run the STILT model, because installing things is hard.

Step 0: Install git `sudo apt update && sudo apt install -y git`

Step 1: Clone this repo with `git clone https://github.com/jmileson/stilt_build.git && cd stilt_build`

Step 2: Run the setup script to install docker `./setup.sh`
  - If the script won't run, use `sudo chmod +x setup.sh`, then run the script

Step 3: Logout and log back in, and `cd` into the `stilt_build` directory.

Step 4: Run the image build script with `./build_stilt_image.sh`, then wait, because building the Docker image will take a while, grab some coffee.

Step 5: Run the example with `./run_example.sh` (`chmod` if it won't run)
