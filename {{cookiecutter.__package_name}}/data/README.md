# Data Directories

This directory is tracked by dvc, so that the data is versioned and can be shared with other contributors. The data directory is organized as follows:

## raw

The original datasets pulled from a source system.

## interim

Datasets created during the interim steps of a data pipeline. This folder is mostly for creating copies of interim datasets for debugging purposes.

## processed

The output datasets from data pipelines. Generally used as the input to modeling.
