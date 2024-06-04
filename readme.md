# My lecture notes & ML sandbox 

Topics covered:
- ML
- Data Science
- Jupyter Labs
- Python
- ~~Anaconda~~
- Pandas
- MatPlotLib

# Intall

## Make(uses docker instructions below)

```
> make

Hi friendlyantz! Welcome to ml-sandbox

Getting started

make install                  install dependencies
make run                      launch app
```

## Docker

```sh
docker pull jupyter/scipy-notebook

# docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v <YOU_LOCAL_WORKING DIRECTORY_PATH>:/home/jovyan/work jupyter/scipy-notebook
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $PWD:/home/jovyan/work jupyter/scipy-notebook
```

 ## Conda

~~`conda install -c conda-forge jupyterlab`~~

~~`conda create --prefix ./env pandas numpy matplotlib scikit-learn`~~



