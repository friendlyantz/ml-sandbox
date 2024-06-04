## My lecture notes & ML sandbox 

Topics covered:
- ML
- Data Science
- Jupyter Labs
- Python
- ~~Anaconda~~
- Pandas
- MatPlotLib

~~`conda install -c conda-forge jupyterlab`~~

~~`conda create --prefix ./env pandas numpy matplotlib scikit-learn`~~

```sh
docker pull jupyter/scipy-notebook

# docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v <YOU_LOCAL_WORKING DIRECTORY_PATH>:/home/jovyan/work jupyter/scipy-notebook
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $PWD:/home/jovyan/work jupyter/scipy-notebook
```

