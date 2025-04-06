# main.tf
resource "aws_security_group" "cluster" {
  name        = "${var.cluster_name}-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-cluster-sg"
    }
  )
}

resource "aws_security_group" "nodes" {
  name        = "${var.cluster_name}-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-node-sg"
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

# Cluster security group rules
resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port               = 443
  protocol                = "tcp"
  security_group_id       = aws_security_group.cluster.id
  source_security_group_id = aws_security_group.nodes.id
  to_port                 = 443
  type                    = "ingress"
}

# Node security group rules
resource "aws_security_group_rule" "nodes_inbound" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port               = 1025
  protocol                = "tcp"
  security_group_id       = aws_security_group.nodes.id
  source_security_group_id = aws_security_group.cluster.id
  to_port                 = 65535
  type                    = "ingress"
}

resource "aws_security_group_rule" "nodes_internal" {
  description              = "Allow nodes to communicate with each other"
  from_port               = 0
  protocol                = "-1"
  security_group_id       = aws_security_group.nodes.id
  source_security_group_id = aws_security_group.nodes.id
  to_port                 = 65535
  type                    = "ingress"
}

resource "aws_security_group_rule" "nodes_outbound" {
  description = "Allow worker nodes outbound access"
  from_port   = 0
  protocol    = "-1"
  security_group_id = aws_security_group.nodes.id
  cidr_blocks = ["0.0.0.0/0"]
  to_port     = 0
  type        = "egress"
}
