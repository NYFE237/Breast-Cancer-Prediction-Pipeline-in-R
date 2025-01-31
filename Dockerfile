FROM rocker/tidyverse:latest
WORKDIR /app
COPY . /app/
RUN R -e 'install.packages(c("caret", "randomForest", "shapviz", "lime", "ggplot2", "corrplot", "reshape2", "testthat"))'
CMD ["Rscript", "run_pipeline.R"]
