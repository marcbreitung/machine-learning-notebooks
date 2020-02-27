# Machine Learning Presentation Jupyter Notebook

## Build Docker 
```
 docker build -t drole/jupyter-ml .
```

## Run Docker 
```
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd):/home/jovyan/work drole/jupyter-ml:latest
```
