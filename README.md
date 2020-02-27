# Machine Learning Presentation Jupyter Notebook

## Docker 
```
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd):/home/jovyan/work Tags	drole/jupyter-ml:latest
```