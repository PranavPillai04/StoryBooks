# File to save commands so we don't have to remember them in the future

PROJECT_ID=feisty-enigma-388004

run-local:
	docker-compose up

###

create-tf-backend-bucket:
# "make bucket" command, bucket name (PROJECT_ID-terraform) must be globally unique
#	gsutil mb -p $(PROJECT_ID) -l us-central1 gs://$(PROJECT_ID)-terraform-pranav12
	gsutil mb -p $(PROJECT_ID) gs://$(PROJECT_ID)-terraform-pranav12

ENV=staging

# Run in terminal: export GOOGLE_APPLICATION_CREDENTIALS=$PWD/terraform/terraform-sa-key.json

terraform-create-workspace:
	cd terraform && \
		terraform workspace new $(ENV)

terraform-init:
	cd terraform && \
		terraform workspace select $(ENV) && \
		terraform init