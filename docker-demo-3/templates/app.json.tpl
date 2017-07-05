[
  {
    "essential": true,
    "memory": 256,
    "name": "myapp",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:${APP_VERSION}",
    "portMappings": [
        {
            "containerPort": 8888,
            "hostPort": 8888
        }
    ]
  }
]