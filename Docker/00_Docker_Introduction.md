# What is container?
* A way to package applications with all the necessary dependencies and configuration
* Portable artifact easily shared and moved around
* Makes development and deployment more efficient
* Layers of linux base image, application image with configuration


# Where do container live?
* Container repository
  * Private repository {AWS, GCP, Azure}
    * Private Repository (AWS ECR)
    * Private Repository (Azure Container Registry)
    * Private Repository (Google Container Registry)
  * Public repository {DockerHub}
    * Docker Registry (Open Source, limited features)
    * Docker Hub
    * Docker Trusted Registry (Enterprise, lots of features)


# Application Deployment
* No environment configuration needed on server - except for docker runtime
