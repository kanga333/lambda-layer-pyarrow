S3_BACKET   := 
S3_PREFIX   := 
STACK_NAME  := 

clean:
	rm -rf workdir/python/*
	rm -rf .template.yml

pip:
	docker run -v `pwd`:/tmp/work -w /tmp/work \
	   kanga333/pylambda-packer \
	   python3 -m pip install -r requirements.txt -t workdir/python

package: clean pip
	aws cloudformation package \
		--template-file sam.yml \
		--s3-bucket $(S3_BACKET) \
		--s3-prefix $(S3_PREFIX) \
		--output-template-file .template.yml

deploy:
	aws cloudformation deploy \
		--template-file .template.yml \
		--stack-name $(STACK_NAME)

.PHONY: clean pip package deploy