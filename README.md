# DevOpsExample

Set of tools/scripts to configure a server on DigitalOcean running Docker+Nomad


## Usage

Run `make terraform` to setup the infrastructure.

* Give it the ID of your SSH key (or modify the terraform file to add one.)
* An API Key.

You can also set those as environment variables (TF_VAR_do_sshkey and TF_VAR_do_token).

This will give you a machine running Nomad in approximately about 5 mins.

Now run something like:

`ssh -L localhost:4646:INTERNAL_IP:4646 root@HOST`

So you can now deploy jobs onto the machine.
