# 33c3_pdfmaker
Challenge for the [33c3ctf](https://33c3ctf.ccc.ac) worth 75 points.

## Setup
To get the code:

```
  $ git clone git@github.com:Gram21/33c3_pdfmaker.git
  $ cd 33c3_pdfmaker
```

## Running

We used docker for easy deployment:

```
  $ ./docker_build.sh
  $ ./docker_start.sh
```

The server is runnin on port 24242. Temporary files older than 5 minutes will be deleted regularly.
Upon starting the server the deployment updates itself via git (with a deployment key).
