This repo is a demonstration of using Terraform to deploy Nginx server on AWS cloud.

Instructions:
1. Clone the Repo
2. Run the command: terraform init
3. Follow the Instructions in config.tf.example

Still Missing:
- Dynamically add web servers by changing "webservers_count". Currently HAProxy doesn't updates.
