.PHONY: collections syntax lint validate

collections:
	ansible-galaxy collection install -r requirements.yml

syntax:
	ansible-playbook --syntax-check playbooks/bootstrap.yml
	ansible-playbook --syntax-check playbooks/site.yml
	ansible-playbook --syntax-check playbooks/validate.yml
	ansible-playbook --syntax-check playbooks/stop_agents.yml

lint:
	yamllint .
	ansible-lint

validate: syntax lint

