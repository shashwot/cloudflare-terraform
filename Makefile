# Variables
TF_CMD           := terraform
TF_INIT_CMD      := $(TF_CMD) init
TF_PLAN_CMD      := $(TF_CMD) plan
TF_APPLY_CMD     := $(TF_CMD) apply
TF_DESTROY_CMD   := $(TF_CMD) destroy

# Default workspace and tfvars file
TFVARS_FILE      := terraform-dev.tfvars

.PHONY: init plan apply destroy

# Targets
init:
	$(TF_INIT_CMD)

plan:
	$(TF_PLAN_CMD) -var-file $(TFVARS_FILE)

apply:
	$(TF_APPLY_CMD) -var-file $(TFVARS_FILE)

destroy:
	$(TF_DESTROY_CMD) -var-file $(TFVARS_FILE)

