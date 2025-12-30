resource "aws_ecs_cluster" "main" {
    name = "threatcomp-cluster"
}

resource "aws_ecs_task_definition" "app" {
    family                   = "threatcomp-task"
    execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.fargate_cpu
    memory                   = var.fargate_memory

    container_definitions = jsonencode([
    {
        name      = "threatcomp-app"
        image     = var.app_image
        essential = true
        portMappings = [
        { containerPort = var.app_port, hostPort = var.app_port, protocol = "tcp" }
    ]
    }
])  
    runtime_platform {
        operating_system_family = "LINUX"
        cpu_architecture        = "ARM64"
}
}

resource "aws_ecs_service" "main" {
    name            = "threatcomp-service"
    cluster         = aws_ecs_cluster.main.id
    task_definition = aws_ecs_task_definition.app.arn
    desired_count   = var.app_count
    launch_type     = "FARGATE"

    network_configuration {
    security_groups  = [var.ecs_tasks_sg_id]
    subnets          = var.private_subnet_ids
    assign_public_ip = false
    }

# Added ALB dependency after applying ALB
load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "threatcomp-app"
    container_port   = var.app_port
}

depends_on = [var.listener_arn]

}

