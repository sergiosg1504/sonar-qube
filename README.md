# CI/CD using Jenkins and SonarQube with Docker containers

The main purpose of the repository is set up a CI/CD pipeline using Jenkins and SonarQube with Docker containers that could be used for any project and fully operational in a few minutes.

## Before you start

- Has [docker](https://docs.docker.com/engine/install/) installed in your machine. It's in any operating system.
- Modify the file `docker.env` with the values you want to use in the containers, be aware that the values you set in this file will be used in the `docker-compose.yml` file and any explanation in this file may be adjusted.
- Rename the `docker.env` file to `.env` to be used by the `docker-compose.yml` file.

### How to use an isolated SonarQube instance

1. Run docker: docker compose up -d --build

2. Access to the SonarQube: [http://localhost:9000/](http://localhost:9000/)

3. Login with the next credentials:
   Login: admin
   Password: admin
   The first time you access you will be asked to change the password (The new password must be the same as the one set in the `docker.env` file in the `SONARQUBE_ADMIN_PASSWORD` variable)

4. Create a new project and generate a token for the project:

   - Click on 'Projects'
   - Click on 'Create project'
   - Fill the form with the next values:
     - Name: your_project_name
     - Key: your_project_key
     - Branch name: your_branch_name
   - Click on 'Next'
   - Click on 'Use the global setting'
   - Click on 'Create project'
   - Click on 'Locally'
   - Click on 'Generate'

5. Copy the file '/your-project/sonar-project.properties' into the root of the project you want to analyze

6. Replace the next values in the file:

   - sonar.projectKey=your_project_key
   - sonar.projectName=your_project_name
   - sonar.projectVersion=1.0
   - sonar.sources=.
   - sonar.host.url=<http://sonarqube:9000>

7. Run the next command in the root of your project: docker run --rm --network="sonar-qube_sonarnet" -v "$(pwd):/usr/src" -e SONAR_TOKEN="YOUR_TOKEN" sonarsource/sonar-scanner-cli

## Developed by

| [<img src="https://avatars.githubusercontent.com/u/92031193?v=4" width="100">](https://github.com/JuanjoLopez19) | [<img src="https://avatars.githubusercontent.com/u/92520941?v=4" width="100">](https://github.com/robertomergon) | [<img src="https://avatars.githubusercontent.com/u/92520473?v=4" width="100">](https://github.com/sergiosg1504) |
| :--------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: |
|                               **[Juanjo López](https://github.com/JuanjoLopez19)**                               |                             **[Roberto Merchán](https://github.com/robertomergon)**                              |                              **[Sergio Sánchez](https://github.com/sergiosg1504)**                              |
