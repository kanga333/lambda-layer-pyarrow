# lambda-layer-pyarrow

Deploy pyarrow and pandas as a lambda layer.


## How to use

### Create Lambda layers

```
make package S3_BACKET='backet_name' S3_PREFIX='prefix_name'
make deploy STACK_NAME='stack_name'
```

Note: `make package` uses the dokcer image of [pylambda-packer](https://hub.docker.com/r/kanga333/pylambda-packer/) for build. 
It is because some Python module requires build on AmazonLinux.
