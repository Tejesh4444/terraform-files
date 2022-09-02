resource "aws_elb" "teju" {
  name               = "elb"
  security_groups    = ["sg-01dff039f9c609750"]
  subnets            = ["subnet-09788312859f3cdc1"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }
  instances                   = ["i-089a329016facc7c4"]
  cross_zone_load_balancing   = true
  idle_timeout                = 40
  connection_draining         = true
  connection_draining_timeout = 40
  tags = {
    Name = "terraform-elb"
  }
}  
