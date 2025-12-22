variable "application_name" {}
variable "mp_project" {
  default = "zzl"
}
variable "mp_region" {
  default = "apne2"
}
variable "mp_environment" {
  default = "dev"
}
variable "pipeline_branch" {}
variable "build_compute_size" {
  default = "BUILD_GENERAL1_LARGE"
}
variable "build_image" {
  default = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "build_image_credential_type" {
  default = "SERVICE_ROLE"
}
variable "build_privileged_mode" {
  type    = bool
  default = false
}
variable "buildspec_name" {
  default = "buildspec.yaml"
}
variable "codebuild_vpc_id" {
  default = "vpc-06e254347e7bdbc40"
}
variable "codebuild_vpc_subnets" {
  default = ["subnet-03dce5558067b25aa", "subnet-0700b796f53811510"]
}
variable "codebuild_vpc_sg" {
  default = ["sg-08c45cad807411ebd"]
}
variable "codebuild_environment_variables" {
  default = []
}
variable "need_approval" {
  type    = bool
  default = false
}
variable "need_build_approval" {
  type    = bool
  default = false
}
variable "ecs_cluster_name" {
  default = "zzl-apne2-ecs-cluster-dev"
}
variable "ecs_service_name" {}
variable "ecs_deploy_taskdef_filename" {
  default = "taskdef.json"
}
variable "appspec_name" {
  default = "appspec.yml"
}
variable "ecs_is_bluegreen" {
  type    = bool
  default = false
}
variable "codedeploy_app_name" {
}
variable "codedeploy_deploymentgroup_name" {
}
# variable "pipeline_chatbot_arn" {
#   default = ""
# }
variable "secret_arn" {}
variable "github_connection_arn" {}
variable "github_fullrepository_id" {}
variable "approval_sns_topic_arn" {
  type    = string
  default = ""
}

variable "codebuild_cache_type" {
  type    = string
  default = "NO_CACHE"
}

variable "codebuild_cache_location" {
  type    = string
  default = null
}

variable "codebuild_cache_modes" {
  type    = list(string)
  default = []
}

variable "source_detect_changes" {
  type    = string
  default = "true" # or "false"
}

variable "source_output_artifact_format" {
  default = "CODE_ZIP"
}

variable "pipeline_type" {
  default = "V1"
}

variable "pipeline_build_env" {
  type = list(object({
    name  = string
    value = string
    type  = string # Allows specifying type (e.g., PLAINTEXT, PARAMETER_STORE)
  }))
  default = []
}

variable "need_deploy_stage" {
  type    = bool
  default = true
}

variable "additional_deploy_actions" {
  type = list(object({
    name             = string
    category         = string
    owner            = string
    provider         = string
    version          = string
    input_artifacts  = optional(list(string), [])
    output_artifacts = optional(list(string), [])
    configuration    = optional(map(string), {})
    run_order        = optional(number, 1)
  }))
  default     = []
  description = "사용자 정의 deploy 단계의 추가 action 리스트"
}
variable "build_approval_timeout_in_minutes" {
  description = "Optional timeout (in minutes) for BuildApproval manual approval action"
  type        = number
  default     = null
}
