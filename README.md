# Terraform SaltStack Master Server

Basic terraform plan to create a saltstack server in my vmware stack.  The
purpose of this is to take an instance from nothing to a completely functional
saltstack server without any intervention. This will eventually be moved to
AWS but is easier for me to work out in my home lab.

### Terraform Setup
Set some environment vars or this is going to fail:
```
export TF_VAR_vsphere_user="user@domain.com"
export TF_VAR_vsphere_password="suP3r5eCR37p@ssW0rd!"
export TF_VAR_vsphere_server="vcenter.domain.com"
export TF_VAR_vsphere_allow_unverified_ssl="true"
```

Pull down this repo:
```
git clone git@github.com:rch317/tf-salt.git
```

Initialize terraform:
```
cd tf-salt
terraform init
terraform get
```

Create a plan:
```
terraform plan --out=plan.out
```

Apply the plan:
```
terraform apply plan.out
```

magic...
