# flask-devops-app

A small Flask web application built for a DevOps course midterm project to demonstrate CI/CD pipelines, 
version control, Infrastructure as Code (IaC), health monitoring, and local deployment — all without using Docker or cloud platforms.

Screenshots of deployment, pipeline, and app -> are all in a PDF file 

---

## Project Description

This project simulates a full DevOps pipeline using local tools. It has:

- A basic Python Flask web app with one dynamic route and form input.
- Automated testing with Pytest.
- CI pipeline with GitHub Actions.
- Infrastructure provisioning using Ansible.
- Local deployment simulation using Blue-Green deployment.
- Health monitoring using a curl-based shell script.

---

## Tools and Technologies Used

| Category               | Tool                     |
|------------------------|--------------------------|
| Programming Language   | Python 3 / Flask         |
| Version Control        | Git + GitHub             |
| CI/CD Pipeline         | GitHub Actions           |
| Testing                | Pytest                   |
| Infrastructure as Code | Ansible                  |
| Monitoring             | Bash + curl              |

## CI/CD and IaC explanation.

### Continuous Integration (CI)
- Configured using GitHub Actions (`.github/workflows/ci.yml`).
- On every push to main or dev, the pipeline runs:
  - pip installs all dependencies.
  - Pytest runs unit tests.
  - Linting/syntax checks.

### Continuous Deployment (CD)
- Deployment is simulated locally via `deploy.sh`.
- It copies the app to a /tmp/prod-flask folder.

### Blue-Green Deployment
- Two folders, `/tmp/blue` and `/tmp/green` simulate environments.
- A symbolic link `/tmp/current` switches between them.
- Rollback is possible by switching back symlink.

### Infrastructure as Code (IaC)
- Uses `provision.yml` Ansible playbook.
- Installs Python, pip, Flask, and creates a deployment folder.
- Can be run inside WSL using: -- ansible-playbook provision.yml --ask-become-pass

## Monitoring
- health_check.sh uses curl to ping the app endpoint.
- Logs results with timestamp to health.log.
- Can be scheduled using cron, but I didn't as it would be down most of the time, so no actual use...
  
## DevOps Workflow Diagram (i dont know how to upload a picture here so this has to work)
  ┌────────────┐
  │ Developer  │
  └────────────┘
       │  Push code to GitHub (dev/main)
       ▼
┌────────────────┐
│ GitHub Actions │─────
└────────────────┘     │
        │              ▼
Run Tests (Pytest)     CI Feedback
        │
 ┌──────▼───────┐
 │ Ansible IaC  │───> Sets up local env
 └──────────────┘
        ▼
 ┌──────────────┐
 │ deploy.sh    │──> Deploys to /tmp/prod-flask
 └──────────────┘
         |
Simulated Blue/Green folders
         |
         ▼
  ┌─────────────────┐
  │ health_check.sh │──> curl + logs every hour
  └─────────────────┘


