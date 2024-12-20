1. Run docker: `docker compose up -d --build`

2. Access to the SonarQube: `http://localhost:9000/`

3. Login with the next credentials: admin/admin

4. Create a new project and generate a token for the project

5. Copy the file `'/your-project/sonar-project.properties'` into the root of your project

6. Replace the next values in the file:
    - `sonar.projectKey=your_project_key`
    - `sonar.projectName=your_project_name`
    - `sonar.projectVersion=1.0`
    - `sonar.sources=.`
    - `sonar.host.url=http://sonarqube:9000`

6. Run the next command in the root of your project: `docker run --rm --network="sonar-qube_sonarnet" -v "$(pwd):/usr/src" -e SONAR_TOKEN="YOUR_TOKEN" sonarsource/sonar-scanner-cli`