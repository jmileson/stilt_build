#!/bin/bash

# Fetch example met data for testing
TUTORIAL_DIR=/tmp/stilt-tutorials
if [[ ! -d "$TUTORIAL_DIR" ]]; then
  git clone https://github.com/uataq/stilt-tutorials /tmp/stilt-tutorials
else
  echo "Tutorials already available in $TUTORIAL_DIR"
fi

# harcoded directories for running the first example
METDIR=/tmp/stilt-tutorials/01-wbb/met
OUTDIR=/tmp/stilt-out
mkdir -p "$OUTDIR" "$METDIR"

# example for running stilt
# METDIR: Full directory path in which ARL compatible meteorological data files can be found
# OUTDIR: where the output goes, duh
docker run \
  --rm \
  --mount type=bind,source=$METDIR,destination=/app/met,readonly \
  --mount type=bind,source=$OUTDIR,destination=/app/out/by-id \
  stilt \
  r_run_time=2015-12-10T00:00:00Z \
  r_lati=40.5 \
  r_long=-112.0 \
  r_zagl=5 \
  met_loc=/app/met \
  met_file_format=%Y%m%d.%H \
  xmn=-112.3 \
  xmx=-111.52 \
  xres=0.01 \
  ymn=40.39 \
  ymx=40.95 \
  yres=0.01


