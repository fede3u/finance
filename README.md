Zipline in Docker
================================================================================
[Zipline](http://www.zipline.io) is an algorithmic trading library written in Python, and [Anaconda](https://www.continuum.io/anaconda-overview) is a data science platform. Installing Zipline with Anaconda in a Docker container is useful for testing trading strategies in a [Jupyter Notebook](http://jupyter.org).


Bring up a Jupyter Notebook at [http://localhost:8888](http://localhost:8888)
--------------------------------------------------------------------------------
```sh
docker run -it --rm -p 8888:8888 modernscribe/zipline
```

This will save notebooks outside of the Docker container.
```sh
docker run -it --rm -p 8888:8888 -v $PWD:/root/notebooks modernscribe/zipline
```


Bring up a Jupyter Notebook with Docker Compose
--------------------------------------------------------------------------------
After getting the files from [github.com/modernscribe/zipline](https://github.com/modernscribe/zipline), run the following command to bring up Jupyter Notebook at [http://localhost:8888](http://localhost:8888).
```sh
docker-compose up -d
```