Quandl, Anaconda & Jupyter Lab in Docker
================================================================================
[Quandl](https://www.quandl.com) is is a marketplace for financial, [Plotly] (https://plot.ly/) is a framework for charting and building analytic web apps,[Anaconda](https://www.anaconda.com) is a data science platform. Having Quandl, Plotly and Anaconda in a Docker container is useful for analyzing financial data and testing trading strategies in [Jupyter Notebook](http://jupyter.org) on your own computer.


Bring up Jupyter Notebook
--------------------------------------------------------------------------------
```sh
docker run -it --rm -p 8888:8888 fede3u/finance
```

Then, view the notebook at [http://localhost:8888](http://localhost:8888).

This will save notebooks outside of the Docker container:
```sh
docker run -it --rm -p 8888:8888 -v $PWD:/root/notebooks fede3u/finance 
```

You can find the running container's name like so:
```sh
docker ps -a
```

Then, you can use the container's name to connect to the running container if you'd like to run commands outside of the notebook.
```sh
docker exec -it <container name> bash
```

