Zipline, Anaconda & Jupyter Notebook in Docker
================================================================================
[Zipline](http://www.zipline.io) is an algorithmic trading library written in Python, and [Anaconda](https://www.continuum.io/anaconda-overview) is a data science platform. Having Zipline and Anaconda in a Docker container is useful for testing trading strategies in [Jupyter Notebook](http://jupyter.org) on your own computer.


Bring up Jupyter Notebook
--------------------------------------------------------------------------------
```sh
docker run -it --rm -p 8888:8888 modernscribe/zipline
```

Then, view the notebook at [http://localhost:8888](http://localhost:8888).

This will save notebooks outside of the Docker container:
```sh
docker run -it --rm -p 8888:8888 -v $PWD:/root/notebooks modernscribe/zipline 
```

You can find the running container's name like so:
```sh
docker ps -a
```

Then, you can use the container's name to connect to the running container if you'd like to run commands outside of the notebook.
```sh
docker exec -it <container name> bash
```


Bring up a notebook with Docker Compose
--------------------------------------------------------------------------------
After getting the files from [github.com/modernscribe/zipline](https://github.com/modernscribe/zipline), run the following command to bring up Jupyter Notebook at [http://localhost:8888](http://localhost:8888). This will store notebooks and cached data outside of the Docker container.
```sh
docker-compose up -d
```